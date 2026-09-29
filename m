Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0CC344021
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 07:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667496; cv=none; b=b+3roK4y6R09KShG811ylhXigBj+g7EJK/0weX4yyp7i8qdpx23Ykpg/MFt77Kih0xtWTfGRHBq6vMNVgHTe5sBajatZzv5dBycxFkyfFbqpbsJXKB02vGvoKQm7XKpjPIQZl8GaxItqED98ERs7PEhsu4BGUH01Z7Gg/SRE2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667496; c=relaxed/simple;
	bh=ODVKLSw4UQBJXZZmNH9DKwFhJw9Ac3420dO3fQGtAag=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZShbbhVihlTtULyKHncbyusmgQdGrzAzkw4FgVHzgVVut1S60afuAjk3IB3+iFeWWpJ/2ktUIkZqGx+41XQkizAvXJFwN4Ov88LdbZCClazQhsxBOt0Y4B7rWDYzRnJq/Xapi1x5tMIflBKxSCIHW75ZLcQgSzuqZUgkV4iocJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rv5M1cI+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rv5M1cI+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso13612315e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 00:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790667493; x=1791272293; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olPoRoj6Q3FNvSOVrmcrQZUWbcZjryfiG4iHSOAucPk=;
        b=rv5M1cI+o0DyARftyHJXliHYZwSwFpLUhnvNEVn3T3XKzOFRREMrY8twsE3SYLVzhL
         NfiQzY+dOoum0bQ3u0RtdiF2mJYnlHFUzwSdTe7bxix1SrkZq6ymXY+waBJvbRbSb/LU
         dNG2jZfdqTcz9Xy6UOSfYTbKWfWLwh7RCh6llt/seOGEbiqKHmvLUaGogOWnE5kqtoXx
         FX4s145e31mtdfJIrXmjMwOaTIvjzYGIX8y69AAQ3S5W3eHp6QL2AVqjgl2sDgpSDaOq
         v3NMP9T6BR+05yIWqm4ct7sr5CWv/rbZafXgV7ihzYB84JHbyBLEfH7scTaHECGiH7OG
         PhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667493; x=1791272293;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olPoRoj6Q3FNvSOVrmcrQZUWbcZjryfiG4iHSOAucPk=;
        b=hUfDyw46Jk73qAJ4fNa7MhZU6yIp1aWs5NaK1xD88ZOmFPsl5mE2/XL7+bYeJ7X67H
         oFKUt5pEbEBgb/Zqv+aYfOF8vixTqQrSslPVKQn5ltsM9HhDChUksDKbbQKzevCPjzhN
         huKjrcVenrJR5TtnyC+/z5CNG/X1zLxvu+q3yUpuTjW2aKEfcvqxNdDFRdXT96uob3X8
         1j9NvNS+kh/vOTwtudW5+mDj94TzKfH37fmp+HPJ7qmj6ZL+njT3PX+F6d7jHR/huNUW
         hyYz78/xC8tJho8I87110qpxjhYiEEAiazIjSGJWZ91s/QDE/G5jUIrdJhLhyynP2kqr
         lNOA==
X-Gm-Message-State: AFuF++kQcrJNk1x7n0srcmreXcGx2lyc/WiwSC/uH6LBBPUSGeYN1gxI
	nl9U631QmuifUJX6rvqWyQHkCiXLKck9qPeZeX7j0e7QqnSvMkI5QYlI
X-Gm-Gg: AYBFou3GIkV5NGXMdnlkgpdQZ3B53/l93257RhM9caJ7ou+pBpM0VlRvyQJzslByTc7
	j5NGoPdg/Wdwyd1JbSIV/h7qBMKccgJ2EN6Ifse+OTiLq2/BnoPafyI1yEljm1yj0V2Xr3QRxLN
	9wi586/kCNXowm6nOrwNwH2YoTbqOeIjQ7G2GMpuC9yWkEQkbBd33lP1v5r16/FAxdE103v8YRl
	wd3WMH1s/XDt1lHLri559JVilKIVxOaQFCiOrgxIDGYxfFog40KZm++t/5P33NDK8F8piPn8fzB
	2tar/T7pXsL/fFY47urmt5P7itU8xT63XWXTJw1GLeJ/ugufLl+5r4bcYaKIjKwSTOmrY8JH2wF
	q5Kd3GIQa+/2MF1AtRmluK7zj6mM3XD8d16vH6tFPYr2Sqtukzeb7PrAIC/S1VIIZODeXqWQAn7
	kwSUE6sG4y56vDMnByD1KCM4+8i1uTK5F8C3NGDqcgZJT8SVxwYb1SiPfT+7kLkGbvq+QJy9Ech
	5E4ZtQKWnEJbG5AXsdsjVTrPnE1nu4=
X-Received: by 2002:a05:600c:540e:b0:4a0:1d:3ac4 with SMTP id 5b1f17b1804b1-4a0001d3ba8mr127287325e9.6.1790667493041;
        Tue, 29 Sep 2026 00:38:13 -0700 (PDT)
Received: from Abds-MacBook-Air.local ([141.2.113.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm53285835e9.7.2026.09.29.00.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:38:12 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: yukuai@fygo.io, linux-raid@vger.kernel.org
Subject: Re: [PATCH 2/2] md: add a control device for array management
In-Reply-To: <20260928202622.B1EC61F000FF@smtp.kernel.org>
References: <20260928201224.3602262-1-abd.masalkhi@gmail.com>
 <20260928201224.3602262-3-abd.masalkhi@gmail.com>
 <20260928202622.B1EC61F000FF@smtp.kernel.org>
Date: Tue, 29 Sep 2026 09:38:11 +0200
Message-ID: <m2ecec4ie4.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Kuai,

Sorry, I forgot to mark this series as RFC.

On Mon, Sep 28, 2026 at 20:26 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 9 potential issu=
e(s) to consider:
> - [High] md: MD_STOP_ARRAY mutual exclusion bypass via control device
> - [High] md: md_ctl_exit is marked __init and omitted from md_exit()
> - [High] md: self-deadlock in get_mddev_dev and get_mddev_uuid via mddev_=
put
> - [Medium] md: binary UUID lookup fails for UUIDs starting with 0x00
> - [Medium] md: missing null-termination enforcement allows stack OOB read
> - [Low] md: direct cast from __u64 to user pointer causes warnings
> - [Low] md: uninitialized pointer passed to get_raid_version()
> - [Low] md: unknown ioctl flags return -ENOTTY instead of -EINVAL
> - [Low] md: unprivileged un-ratelimited pr_err allows log flooding
> --
>
> commit dd168c18138734c235c0b8b1c097fa7a18b6baa8
> Author: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> Subject: md: add a control device for array management
>
> This patch introduces a misc character device, /dev/md-control, to allow
> MD management ioctls without holding a block device reference. New 64-bit
> safe ioctls are provided that specify the target array by name, UUID, or
> device number.
>
>>     The new ioctls use the existing MD_MAJOR ioctl type, starting at 0x4=
0,
>>     with an MD_ prefix. Every request structure has a flags field. Unkno=
wn
>>     flags are rejected with -EINVAL.
>
> [Severity: Low]
> The implementation of ctl_flags_valid() below actually returns -ENOTTY for
> unknown flags. Should the implementation be updated to match this documen=
ted
> behavior?
>
I will fix this in v2.

> diff --git a/drivers/md/md-ctl.c b/drivers/md/md-ctl.c
> new file mode 100644
> index 0000000000000..84923b0a2fa3c
> --- /dev/null
> +++ b/drivers/md/md-ctl.c
> @@ -0,0 +1,597 @@
> [ ... ]
> +static struct mddev *get_mddev_dev(dev_t dev)
> +{
> +	struct mddev *mddev, *ret =3D NULL;
> +
> +	if (MINOR(dev) >=3D (1 << MINORBITS))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (MAJOR(dev) !=3D MD_MAJOR)
> +		dev &=3D ~((1 << MdpMinorShift) - 1);
> +
> +	spin_lock(&all_mddevs_lock);
> +	list_for_each_entry(mddev, &all_mddevs, all_mddevs) {
> +		if (mddev->unit =3D=3D dev) {
> +			ret =3D mddev_get(mddev);
> +			if (ret && !mddev->gendisk) {
> +				mddev_put(mddev);
> [Severity: High]
> Does calling mddev_put() while holding all_mddevs_lock cause a self-deadl=
ock?
>
I will fix this in v2.

> If the reference count was 0 before mddev_get(), mddev_put() will drop it
> back to 0 and internally call atomic_dec_and_lock(&mddev->active,
> &all_mddevs_lock). Since the current CPU already holds the non-recursive
> all_mddevs_lock, this will deadlock the system. This pattern also appears
> in get_mddev_uuid().
>
> +				ret =3D ERR_PTR(-EBUSY);
> +			}
> +			break;
> +		}
> +	}
> +	spin_unlock(&all_mddevs_lock);
> +
> +	return ret ? ret : ERR_PTR(-ENODEV);
> +}
> +
> +static struct mddev *get_mddev_name(const char *name)
> +{
> +	unsigned long minor;
> +	struct mddev *mddev, *ret =3D NULL;
> +
> +	if (strncmp(name, "md", 2))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (name[2] !=3D '_' && (!isdigit(name[2]) ||
> +			       kstrtoul(&name[2], 10, &minor) ||
> [Severity: Medium]
> Can this result in an out-of-bounds read on the kernel stack?
>
> The name field is populated via copy_from_user() on the md_ctl structure
> without enforcing null-termination. If a user populates the entire 32-byte
> name field without a null terminator, kstrtoul() will read past the array
> bounds into adjacent stack memory until it finds a non-digit character.
>
I will fix this in v2.

> +			       minor > MINORMASK))
> +		return ERR_PTR(-EINVAL);
> [ ... ]
> +static struct mddev *ctl_find_mddev(struct mdu_ioctl *md_ctl)
> +{
> +	struct mddev *ret =3D ERR_PTR(-EINVAL);
> +
> +	if (*md_ctl->uuid) {
> [Severity: Medium]
> Does this correctly evaluate the binary UUID?
>
> Checking *md_ctl->uuid only evaluates the first byte of the 16-byte array.
> If an array is created with a randomly generated UUID that happens to sta=
rt
> with 0x00, the UUID lookup will be skipped and fallback to checking the n=
ame
> or device number instead.
>
I will fix this in v2.

> +		if (*md_ctl->name || md_ctl->dev) {
> +			pr_err("md: only supply one of name, uuid or dev number\n");
> [Severity: Low]
> Could this allow an unprivileged user to flood the kernel log buffer?
>
> Since this is triggered directly by user input via ioctl, using an
> un-ratelimited pr_err() here instead of pr_err_ratelimited() or pr_debug()
> allows dmesg flooding.
>
I will use pr_err_ratelimited() in v2.

> +			return ret;
> +		}
> [ ... ]
> +static long md_ctl_ioctl(struct file *filp, uint cmd, ulong u)
> +{
> +	int err;
> +	unsigned int old_cmd;
> +	unsigned int noio_flags =3D 0;
> +	struct mddev *mddev;
> +	void __user *arg;
> +	struct mdu_ioctl md_ctl;
> +
> +	err =3D ctl_ioctl_valid(cmd);
> +	if (err)
> +		return err;
> +
> +	if (cmd =3D=3D MD_RAID_VERSION)
> +		return get_raid_version(mddev, (struct mdu_version64 __user *)u);
> [Severity: Low]
> Does this pass an uninitialized mddev pointer to get_raid_version()?
>
get_raid_version() should not take mddev as a parameter; I will fix this
in v2.

> mddev is evaluated and passed in a register before it is initialized by
> ctl_find_mddev(), resulting in undefined behavior.
>
> +
> +	if (copy_from_user(&md_ctl, (void __user *)u, sizeof(md_ctl)))
> +		return -EFAULT;
> +
> +	err =3D ctl_flags_valid(cmd, md_ctl.flags);
> +	if (err)
> +		return err;
> +
> +	mddev =3D ctl_find_mddev(&md_ctl);
> +	if (IS_ERR(mddev))
> +		return PTR_ERR(mddev);
> +
> +	old_cmd =3D try_convert_ioctl_cmd(cmd, md_ctl.flags);
> +	if (old_cmd) {
> +		err =3D md_do_ioctl(mddev->gendisk->part0, 0, old_cmd, md_ctl.arg);
> [Severity: High]
> Does delegating to md_do_ioctl() bypass the MD_STOP_ARRAY mutual exclusio=
n?
>
> When MD_STOP_ARRAY is called here via the control device, md_do_ioctl() c=
alls
> mddev_set_closing_and_sync_blockdev(mddev, 1), which assumes the caller h=
olds
> the block device open. Because the control ioctl caller doesn't hold the
> block device, atomic_read(&mddev->openers) > 1 will evaluate to false if
> exactly one other task has the array open, allowing the array to be stopp=
ed
> while it is actively in use.
>
Yes that might happen. I will fix this in v2.

> +		goto out;
> +	}
> +
> +	arg =3D (void __user *)md_ctl.arg;
> [Severity: Low]
> Does this direct cast from __u64 to a pointer cause compiler warnings on
> 32-bit architectures?
>
> It is recommended to use u64_to_user_ptr() to handle the pointer translat=
ion
> correctly for compat userspace.
>
I will fix this in v2.

> +	switch (cmd) {
> [ ... ]
> +void __init md_ctl_exit(void)
> +{
> +	misc_deregister(&md_ctl_misc);
> +}
> [Severity: High]
> Is md_ctl_exit() marked __init by mistake?
>
> Additionally, it appears this function is completely omitted from the
> module unload path (md_exit() in md.c doesn't call it). This would leak t=
he
> misc device when the md module is unloaded, and any subsequent access to
> /dev/md-control would cause a use-after-free panic.
>
I will fix this in v2.

> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928201224.36=
02262-1-abd.masalkhi@gmail.com?part=3D2

--=20
Best Regards,
Abd-Alrhman
