Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157711;
	b=lbju+4QwKsmyVclBOtSugqx2bWf9AM5z+IaGP6IcX02mGy+VKE6/ClChyw8LT5OGu69V
	 7ljHQe0WLyQKrv0CAWTOY+NqYxHJJ5c1aVRCrz7Uvz7JrleVtydo4hVHJpl4An2OGYtqL
	 vdJbBfkCff9jvvy7oJgsVh5BY7UDJl9Y9DYLq++jQnnCwumgPEebU8dxVyl3jr8l/afcv
	 rWEAzqj4MOzj2TQ9R6oKCDa/f3Mkzr+xrHKl2qgrJDEP49J8t6L7wlOGiQ2uR7eaN8DTa
	 2/pAkSLWqgroUuKouX2I/Xnj/0xRd+bNDLTCeWj7m93acU64wnSv3Wm88i1Zmp2Jo6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yUqc+7I9fkDNqG0gHFeWHQ2EttT+25aZhma/FvBj/3o=;
	b=hNXTUzPYrows4RttKDC81cQVsEDU+9yjiBzqdaLgVinlkSNAEkVAsB3KLCZveBjBC/zX
	 ZlfqaE8skZaUnEIEyEN5eNmHvA4fnMsQoZ2tla8W4b3wEzAGy6k2YsszW/M/o/XUyyrH2
	 Th2waA1NutZn/UnAGnwPgaIjWktDSOZRUsV2YSRm5ymQGvcTkj99lPSt+GZdtoikwvWS6
	 UoJ+h7oGF5iFk1qIJGUJPxxNjhDoQ1WdC/ygznagb+GF3WnPv2qAKXoZV853AG1SvAgC0
	 uvCWuFOsyrCtbY0PbQGmrcn8HC/qAQ+o8GZePlpFszTRLbBLeVJoV0dPTGCEMZ5PbiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyD87Rmb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B374F606A331
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 06:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B374F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyD87Rmb
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-702fd86d674so414739eaf.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 22:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795157709; cv=none;
        d=google.com; s=arc-20260327;
        b=VA/lZA7XlZkxHskGOV6e6YgSGPA4KjBYoRl2QzJyQuT7gCiEW+29KsGj29Unq7bUKi
         uWvJCxmH3akBA4fEXZBaKDPttnCBuT24ptNlHAy8Ge3F6QpivZMAJlvAoq+/0OJjtzxG
         RbFXZ8v0o2oUt+e715CRb0St0gZoInzUPq0IxJ4qiu0o9ldyrKooM87sySqTNByYPpvz
         v4/QOtCq0Uxgu1vxfCysyhi81hlwvdbYal34vY0KJnd161Bk8ff2Wnoq+T2pCDm+0SHE
         Smbq8pmXMWGKg69OuQZg9Y/ZRdV/3VUC54XFGSpFYz9YgCIMXF3XWTV61Uo/skjsvAds
         ihmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yUqc+7I9fkDNqG0gHFeWHQ2EttT+25aZhma/FvBj/3o=;
        fh=KJfIEYoDKgfzQ+GI4PRQ5qGTnGO6vip1Z4QcJ5e4GNE=;
        b=lDi5b60ycqa0n2zg4x6BA/b9qKSEqON2rQ0RYzJp7PlMuHwwXgbJQj/K9l6/MgsMhA
         DTYteC09XRcC5Lm46H2xrCKEYS13Zisgx9H9msntBFycM1/ECkUkpJYzmHHqVvmGqAd/
         uHWAvMM6t8r+z4EoibrHZavvm98h+ehB8agkDnerCmZhVIAWcANqGe/vt5yz0Xx3hIWD
         xllOqgvzKVLGNpQDpzDYBeUB9bbuiUV1acFJuTIc52+TCLPIbQqwXRV9Lr4olG721duq
         P6ra0+QaQizU90vCkCTOVEdFeySgXmWAySzKyQLiwvGE4bU9MkYi8q86kCSBI1RUgm7w
         rPJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157709; x=1795762509; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUqc+7I9fkDNqG0gHFeWHQ2EttT+25aZhma/FvBj/3o=;
        b=LyD87RmbRBDpq50rFUozuvhiNW+A7n/7aEjDvu0zOs542Dm02MBPz2B/z6T/uhdTBB
         b03+dZZ+syXewc0dr06280ScqjTzW96xac39vbVlyJJXCkDJgdA7Y+c33qI8GYrtx4m7
         Mqbh2qWk4Xz5c6OSUgUn5jgmZ8wRh50K4osWlDUI9pCv247I4UcTGBwlfZRj4geAKd6r
         v4P0YPof5q5hKNyTfVjnVguZbUmxj/Yg5f2qY3QZV5GaSrX+F7mLMowT58ffy3chacx9
         5Im/pXgTvaA/H4CQgT4NJunibs+jDRIZ652T4ZdE6wJwZxMnKxdPUa0jVw2IMiqqW0UB
         VI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157709; x=1795762509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yUqc+7I9fkDNqG0gHFeWHQ2EttT+25aZhma/FvBj/3o=;
        b=Emta0euQNB/Hl4l8+i0yF2QtrWYV23JJ65IhObU1jrgdv2zFbo/7b6/tBBu4MK3bX5
         VzEjYg/jjLgrsB32yA3mOGKKPH9Tqf9zLAM7cZGlXZ7LpTz82f29DQqU5yg8G21vADFJ
         XOHGd0Y+ExD1uuJtXsRrR9Xj1LjOW4JWJXCWzyMUGGaO+jaEfKc+LZPM2NedQ/vYQmeT
         mwLG9DuBi1z2YdwTQxciAjlImzMYnQeN/rpx4E+1LvuRBLyjlcWu+zvG4592uxR/fIBd
         EY3pLakcS/YVGnSqGtV78G3TzXuVeaDXCimAAXwu9+eD1DdE3lq+8vP7zf4hnd8Julg5
         l+Yw==
X-Forwarded-Encrypted: i=1; AL+hErHyMouEnCVQNcVjNSsOcEHcfQYPoFyOUaW4SNEZiiPH45c7Qdg8a66st+7ma2RMaYfhZiyyZrprFM6bMkHwgjY=@lists.linux.dev
X-Gm-Message-State: APuU4Z92Dvak8GrgOnQ4iuX5krwMSuBFcNJ70ABnUcN78qvEZ8wWP1Bh
	hOC8BYahtm+aJAgejN+xXzv7yqY69qSG9nhZrtRHi8Ptql1CqZeQK3o61/evAmpz9T04t6X5YdS
	GF1ZlY4Omq02SzrlozMPk2vYuFIlh/CM=
X-Gm-Gg: AYBFou0ImSCG7U67FOEljnuv58J6bok7pI6IOji/1hxV1cCaAQqHv6wjf80xRVDrt7m
	Ax9yUxmIBZAF5oynN/SIG9S7dwDdd2gzNezf4Bp2BzDi7tAt8vETMMxW8DnwWnDFcJiYURZXHUT
	qFtbymDddGieMP8CLjv/ZtF9/kRZJ7vZ6M31P0fdY+AmgfC496h6u6Qmp2FRS7eBncfKxIaAWJn
	6ad0rvPSf/hbqI9gX9LbAQIHIG5oyTT9KM+sXdSLiYwfbMX6VFCa0knufQFxGRLcrrsf/dGgO8B
	4iqrTEKh+E2XsrqpkwXrIO8GKEYRksM8JVBrBcSOWAnaZafcf+JcQjGq1Ve55bn1yD3nrEt0btE
	CeukKvE0uzU1gfuQwaxUAul6AMkm03MAJ1UTDymWxJilCl/WoDEgvtT8gkyvUCJZLDTkRxSAOA8
	lsXYkx7KbrcJWKL4EiCELXafg7tAtLrDHN
X-Received: by 2002:a05:6820:a703:10b0:71a:e9b1:65e3 with SMTP id
 006d021491bc7-71b39631876mr1261642eaf.81.1795157709033; Thu, 19 Nov 2026
 22:55:09 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119142114.152052-1-tzimmermann@suse.de> <20261119142114.152052-11-tzimmermann@suse.de>
In-Reply-To: <20261119142114.152052-11-tzimmermann@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 20 Nov 2026 14:54:33 +0800
X-Gm-Features: AclHuK_zcsvJVWcd5lOf-LUFaTbb1PGsprsSd6oBG8EPOYJIPRPC_ZTuRDkP7uc
Message-ID: <CABOQOSVdsELGDEiJu95e5RQ1uRiWLkcwz4TB9xfbQe9qbD7WrA@mail.gmail.com>
Subject: Re: [PATCH 10/11] drm/udl: Allocate URBs on demand
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, sean@poorly.run, tiwai@suse.com, 
	patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 14:45, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Remove the limit on the number of URBs in flight. Allocate URBs as
> needed. Keep once-allocated URBs in a list for reuse at later frames.
> Also remove some bogus debug output from the affected code.
>
> The existing synchronization in atomic_begin() guarantees that udl
> does not send a frame over the USB before the previous frame has been
> transferred. This avoids overloading the USB. If the USB is saturated,
> page flips delay and the compositor reduces the update frequency.
>
> The allocated URBs remain in the cache until the driver is being removed
> from the device. In a later update, a regular worker or a shrinker could
> free the URB cache when needed.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.h  |   1 -
>  drivers/gpu/drm/udl/udl_main.c | 123 ++++++++++++---------------------
>  2 files changed, 44 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index 420166bdc4bc..68bcf0222764 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -45,7 +45,6 @@ struct urb_list {
>         spinlock_t lock;
>         wait_queue_head_t sleep;
>         unsigned int in_flight;
> -       int count;
>  };
>
>  struct udl_device {
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index d0195bd4213d..adddcf4b3451 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -25,13 +25,10 @@
>  #define NR_USB_REQUEST_CHANNEL 0x12
>
>  #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
> -#define WRITES_IN_FLIGHT (20)
>  #define MAX_VENDOR_DESCRIPTOR_SIZE 256
>
>  #define UDL_SKU_PIXEL_LIMIT_DEFAULT    2080000
>
> -static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout);
> -
>  /*
>   * Try to make sense of whatever we parse. Therefore return @end on
>   * errors, but don't fail hard.
> @@ -216,25 +213,41 @@ static struct urb *udl_alloc_bulk_urb(struct udl_device *udl, size_t size)
>         return ERR_PTR(ret);
>  }
>
> +static struct urb *__udl_get_cached_urb_locked(struct udl_device *udl)
> +{
> +       struct urb_node *unode;
> +
> +       assert_spin_locked(&udl->urbs.lock);
> +
> +       if (list_empty(&udl->urbs.list))
> +               return NULL;
> +
> +       unode = list_first_entry(&udl->urbs.list, struct urb_node, entry);
> +       list_del_init(&unode->entry);
> +
> +       return unode->urb;
> +}
> +
>  static void udl_free_urb_list(struct udl_device *udl)
>  {
> +       struct drm_device *drm = &udl->drm;
>         struct urb *urb;
>
> -       DRM_DEBUG("Waiting for completes and freeing all render urbs\n");
> +       drm_dbg(drm, "Waiting for completes and freeing all render URBs\n");
>
> -       /* keep waiting and freeing, until we've got 'em all */
> -       while (udl->urbs.count) {
> -               spin_lock_irq(&udl->urbs.lock);
> -               urb = udl_get_urb_locked(udl, MAX_SCHEDULE_TIMEOUT);
> -               udl->urbs.count--;
> -               spin_unlock_irq(&udl->urbs.lock);
> -               if (WARN_ON(!urb))
> -                       break;
> -               /* Free each separately allocated piece */
> -               udl_free_bulk_urb(urb);
> +       /* keep waiting until we've got 'em all */
> +       scoped_guard(spinlock_irq, &udl->urbs.lock) {
> +               wait_event_lock_irq(udl->urbs.sleep, !udl->urbs.in_flight, udl->urbs.lock);
> +
> +               urb = __udl_get_cached_urb_locked(udl);
>         }
>
> -       wake_up_all(&udl->urbs.sleep);
> +       while (urb) {
> +               udl_free_bulk_urb(urb);
> +
> +               scoped_guard(spinlock_irq, &udl->urbs.lock)
> +                       urb = __udl_get_cached_urb_locked(udl);
> +       }
>  }
>
>  static void udl_urb_list_release(void *data)
> @@ -244,71 +257,16 @@ static void udl_urb_list_release(void *data)
>         udl_free_urb_list(udl);
>  }
>
> -static int udl_alloc_urb_list(struct udl_device *udl, int count, size_t size)
> +static int udl_init_urb_list(struct udl_device *udl)
>  {
>         struct drm_device *drm = &udl->drm;
> -       size_t wanted_size = count * size;
> -       int ret;
>
>         spin_lock_init(&udl->urbs.lock);
>         INIT_LIST_HEAD(&udl->urbs.list);
>         init_waitqueue_head(&udl->urbs.sleep);
> -       udl->urbs.count = 0;
>         udl->urbs.in_flight = 0;
>
> -retry:
> -       while (udl->urbs.count * size < wanted_size) {
> -               struct urb *urb;
> -               struct urb_node *unode;
> -
> -               urb = udl_alloc_bulk_urb(udl, size);
> -               if (IS_ERR(urb)) {
> -                       if (PTR_ERR(urb) == -ENOBUFS && size > PAGE_SIZE) {
> -                               size /= 2;
> -                               udl_free_urb_list(udl);
> -                               goto retry;
> -                       }
> -                       break;
> -               }
> -               unode = urb->context;
> -
> -               list_add_tail(&unode->entry, &udl->urbs.list);
> -
> -               udl->urbs.count++;
> -       }
> -
> -       if (!udl->urbs.count)
> -               return -ENOMEM;
> -
> -       ret = devm_add_action_or_reset(drm->dev, udl_urb_list_release, udl);
> -       if (ret < 0)
> -               return ret;
> -
> -       DRM_DEBUG("allocated %d %d byte urbs\n", udl->urbs.count, (int) size);
> -
> -       return udl->urbs.count;
> -}
> -
> -static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
> -{
> -       struct urb_node *unode;
> -
> -       assert_spin_locked(&udl->urbs.lock);
> -
> -       /* Wait for an in-flight buffer to complete and get re-queued */
> -       if (!wait_event_lock_irq_timeout(udl->urbs.sleep,
> -                                        !udl->urbs.count ||
> -                                        !list_empty(&udl->urbs.list),
> -                                        udl->urbs.lock, timeout))
> -               return NULL;
> -
> -       if (!udl->urbs.count)
> -               return NULL;
> -
> -       unode = list_first_entry(&udl->urbs.list, struct urb_node, entry);
> -       list_del_init(&unode->entry);
> -
> -       return unode->urb;
> +       return devm_add_action_or_reset(drm->dev, udl_urb_list_release, udl);
>  }
>
>  struct urb *udl_get_urb(struct udl_device *udl)
> @@ -321,9 +279,18 @@ struct urb *udl_get_urb(struct udl_device *udl)
>                         return NULL;
>                 ++udl->urbs.in_flight;
>
> -               urb = udl_get_urb_locked(udl, HZ * 2);
> -               if (!urb)
> -                       --udl->urbs.in_flight;
> +               urb = __udl_get_cached_urb_locked(udl);
> +       }
> +
> +       if (!urb) {
> +               urb = udl_alloc_bulk_urb(udl, MAX_TRANSFER);
> +               if (IS_ERR(urb)) {
> +                       scoped_guard(spinlock_irqsave, &udl->urbs.lock) {
> +                               if (udl->urbs.in_flight)
> +                                       --udl->urbs.in_flight;
> +                       }
> +                       return NULL;
> +               }
On a usb contention or stalled device, this might allocate memory unboundedly
if the udl_sync_pending_urbs keeps timing out.
The number of URBs could be limited based on the size of the worst-case
full frame update. The entire urb cache can be cleared on a modeset,
so that maximum memory usage scales with the frame size.

>         }
>
>         return urb;
> @@ -395,8 +362,6 @@ int udl_init(struct udl_device *udl)
>         int ret = -ENOMEM;
>         struct device *dma_dev;
>
> -       DRM_DEBUG("\n");
> -
>         dma_dev = usb_intf_get_dma_device(to_usb_interface(dev->dev));
>         if (dma_dev) {
>                 drm_dev_set_dma_dev(dev, dma_dev);
> @@ -419,8 +384,8 @@ int udl_init(struct udl_device *udl)
>         if (udl_select_std_channel(udl))
>                 DRM_ERROR("Selecting channel failed\n");
>
> -       ret = udl_alloc_urb_list(udl, WRITES_IN_FLIGHT, MAX_TRANSFER);
> -       if (ret < 0)
> +       ret = udl_init_urb_list(udl);
> +       if (ret)
>                 return ret;
>
>         ret = udl_modeset_init(udl);
> --
> 2.56.0
>
>


Best regards,
Jie Feng
