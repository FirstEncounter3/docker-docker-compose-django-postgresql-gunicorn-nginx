from django.core.management.base import BaseCommand, CommandError
# from django.contrib.auth.models import User
from django.contrib.auth import get_user_model

class Command(BaseCommand):
    help = 'Creates a superuser'

    def handle(self, *args, **options):
        username = 'admin'
        email = 'admin@example.com'
        password = 'admin'

        User = get_user_model()
        if User.objects.filter(username=username).exists():
            raise CommandError(f'User with username {username} already exists')

        user = User.objects.create_superuser(username, email, password)
        self.stdout.write(self.style.SUCCESS('Superuser created successfully'))