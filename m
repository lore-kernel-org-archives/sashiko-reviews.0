Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9D3BB687
	for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102079; cv=pass; b=UavgUfI+R7VaihDQPFt4c/Xhl8BT3tVrylFcwcwv5DPa5+UW3G4iIxd22webLLWdBZ2ULkv1feJUWE9fpglZ8w5WVIU2Sqa4Jp69vbcZcl+pf6zw+ZA66jCTboPRuSBj1lV7e3Edbtv0v8cnD0JTfhPtYx9vFUJDPK46S1xx8zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102079; c=relaxed/simple;
	bh=rdWB5ozj+spTYlkn8FMONqaJsNfKg3Tmj30iWcgt0Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=be/gMMD/Nr0rno4YXTW16BqjuF7u9ArFcnJe33/MoVsqH7Kl42IOK2Gn4u5/1fzHjZgOuGf98aVas/e3RoBTuCeLHk0V9DZyOvIo/qxk9qLpZ4PMkucU+NrG8rs1WWun7xT0yzMnCSuPG9hgjqvgLlE+87PitLbokxXEVAqAomY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdrFU6ws; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdrFU6ws"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81e6f0b4610so24247157b3.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 08:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788102077; cv=none;
        d=google.com; s=arc-20260327;
        b=f95ISuoxiIdym9oNvhbBrGH/QWmT8tbR2IGSAKP2tmxZHdVGLmhkWUpjizTREqDGVN
         +CnE299u09usVq1kS0iN8do+n4Pupq1UrCksDm5DSbxy99/vtIscTQ7to1yWL9VXLtrk
         pr6VZh3dn3MAPWbvgKwMaJOjVZHoXXbBYybqTR1KdiqH1aYUCdJRakAF7uQ243eYCOI0
         CadqXMZFalgf35bWhDiDKMPTNDoNKO7XJOv544yYxIeha4VE9lvyh10hvPrWTb354u5I
         3E+opW+C/DlZU3eepey53qbV3IQ4cP72U6NWm6+15wE90i1VKry2OsYm6SasQzzD0/QI
         uLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWv8kE5NmPuamDTVj3WkgrA2uKgkqjgEkM+C+nZ/9jU=;
        fh=r5URhQl6whOcnDbP2Lcwh2ZUr6KpnezK+hz/MEOF1jk=;
        b=Ugv982NXEyt41oZV0WvFxUKkqICBwKUQ6Upc3r/3WBqHPRcy2/gnTnyPN/tKLz9FFM
         0MC3sorOZyiPzWWqDs2VjpFt962gmqxgXcz5ZfOFgr0tGz9pC5PvGIYv1HxOVHVOoHpD
         yjxTZo+9l43pjtahRd//6Z6Tl2xC2tw1NQ8r4CJtCcWhIlqHQ3wm6v4mgErD+tuwn/R1
         gKi5gZgd5Ixs0ExZql6IG0SKEj5jzb7SUy8ujh2wKhQRzkG/JlnarbO5qp2Ytqv4rCzd
         5PMUO019LACEphKkNRSn7nvJqZZfiB/U4EAx/v7WZi65LyqyvxgmeVbbwiS3yB4Ky5LX
         Qfwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788102077; x=1788706877; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWv8kE5NmPuamDTVj3WkgrA2uKgkqjgEkM+C+nZ/9jU=;
        b=sdrFU6wsK1UQluWBe2R978ct/48/pPgX0bI2gUGkMP4TlqlsjhzxOR81PAwt+b2QZf
         TLbaLUQBZlrSoF+Se4jn6HlsUGcFD1KtzL0njZ3SWlTcu2/ZTGF0qjaDwA8CxjLyRe0V
         DwSBruX3gpDBsGQjRtAOX/GOtta4On5rOybQUMwbkVwgZwiVTMLGaDSO9vOMubDU3JOB
         B8ezLHRwjq7qFzAU9o2mbxf6pZ0T6uFzWovMnSdcC+HbiCfusKXacfWaftNrC12zF/9z
         8+8Uzl2ngRtFt5GnKyVU25srs+mWpudFsXtysJvdZOgGOVC3hySO8xQA1TpbSJJJ1xbW
         L1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102077; x=1788706877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWv8kE5NmPuamDTVj3WkgrA2uKgkqjgEkM+C+nZ/9jU=;
        b=T9IyDMDJ9ftPsd7fq3I8ezb871d7oprkaytLoBMgH16ZjhsJqz5dUo5xXHmTea1+cU
         twb8ahZyqZ+J93XPHEBtXdPMzx9VXy4FjEPQYVQcK8mDsaOW8ZZ6XPH5x509oof9/K3J
         rl9DnOhNjNhz6GunLWtGnTAafj4E6h7esN4TtiCFH/HDlYD2I/EWr8HE1ET+OnIaNTzQ
         JVSfVMzXduZy7zdZT/7HuiAgF/uIBXTMdOqtRVcz8WasPogql2qPk67N0DfuJp21LQ1Z
         x35+GqPK5UaTFwfl5sJDt0E7SmHWrZuB+2de4ei/si8QwUBd+JUCdUWyBVAkqS/oYLN1
         asDg==
X-Gm-Message-State: AFuF++mQ+bz2Hf8dOqWzMTYoPi2504IsOeVmwhqaGBMYHqXkWZuauv6e
	DuNxyMnMpb3Dai3kodqErvcaGZ702mqe8d/D8Z7+yT2QPqgr6zMKGcczSAkl9YG1RcVEtfuGOnX
	YSRYEF94fzsHbpLM5pkfANgY0ilazfr20ic0y
X-Gm-Gg: AYBFou3U4a8Wgc1vufr4hszzsUrtxvJmHjN663Ph08Numkt97Z8yqcpgdny5IBN7EFy
	cpVTAqRGz54CbrcuyKYzULKzmW5wATm7nio6GIILHErW9SDznoJfdzP+8xaaOAnlZkyNsQPtFpk
	eIxpMvb+1sqb5DmLy4OIztb2/KCQd3V7HB7u1AV0FPVytkSEqyhpVLyUJ0mskH8WBaosFPEflYl
	GDekGXjVWAeypThG51FtBxVw6ev9JPwvZdvJcd40KxjPLJdwnpAsHuiksE7VWMuXMXwQu1Bhl3R
	SFEvJlcMky887TEy3KWKPeHftCOuy5I9XJ80WMdI9zg=
X-Received: by 2002:a05:690c:a1cd:b0:854:9062:73ae with SMTP id
 00721157ae682-85d6ea15febmr62989437b3.33.1788102077303; Sun, 30 Aug 2026
 08:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828105018.2392383-1-congnt264@gmail.com> <20260828110142.725E61F000E9@smtp.kernel.org>
 <b9792be3-fcd6-468c-9149-7e33640ee167@roeck-us.net>
In-Reply-To: <b9792be3-fcd6-468c-9149-7e33640ee167@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Sun, 30 Aug 2026 22:01:05 +0700
X-Gm-Features: AcwNN1XkumPf31B2w75HyCXH4F80TLKJg296rVJgGwLqokfmQZs_182PytFZij8
Message-ID: <CAJpJ=GtEXcxu+NCwVxx-N+MbX-LAuk7t_4Mm-_kfgUyxk__KOg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 10:58=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 8/28/26 04:01, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Converting to `devm_pm_runtime_enable()` and placing it at the=
 end of `probe()` incorrectly reverses the teardown order, causing PM runti=
me to be disabled too early. This leads to a regulator enable count leak an=
d exposes a sysfs race condition on driver unbind.
> > --
> >
> > commit 728a875c515df8244bd554b338f4f008d88b3b9e
> > Author: Cong Nguyen <congnt264@gmail.com>
> >
> > hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
> >
> > This commit changes the driver to use devm_pm_runtime_enable() during p=
robe
> > and removes the manual pm_runtime_disable() from gpio_fan_stop(). This =
ensures
> > PM runtime is automatically disabled on unbind, fixing an imbalance for
> > alarm-only fans.
> >
> >> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> >> index 084828e1e2817..0bd5561b7a405 100644
> >> --- a/drivers/hwmon/gpio-fan.c
> >> +++ b/drivers/hwmon/gpio-fan.c
> >> @@ -524,8 +524,6 @@ static void gpio_fan_stop(void *data)
> >>      mutex_lock(&fan_data->lock);
> >>      set_fan_speed(data, 0);
> >>      mutex_unlock(&fan_data->lock);
> >> -
> >> -    pm_runtime_disable(fan_data->dev);
> >>   }
> >>
> >>   static int gpio_fan_probe(struct platform_device *pdev)
> >> @@ -581,7 +579,9 @@ static int gpio_fan_probe(struct platform_device *=
pdev)
> >>      }
> >>
> >>      pm_runtime_set_suspended(&pdev->dev);
> >> -    pm_runtime_enable(&pdev->dev);
> >> +    err =3D devm_pm_runtime_enable(&pdev->dev);
> >> +    if (err)
> >> +            return err;
> >
> > [Severity: High]
> > Does moving the pm_runtime_disable() action to the end of probe reverse=
 the
> > teardown order in a way that breaks unbind?
> >
> > Because devm unwinds in LIFO order, registering devm_pm_runtime_enable(=
) at
> > the end of gpio_fan_probe() means pm_runtime_disable() will execute fir=
st
> > during unbind. The cleanup action for gpio_fan_stop() is registered
> > earlier in probe via devm_add_action_or_reset(), so it will execute aft=
er
> > PM runtime has already been disabled.
> >
> > When gpio_fan_stop() calls set_fan_speed(..., 0), it invokes
> > pm_runtime_put_sync(). Since PM runtime is already disabled, this will
> > fail with -EACCES. This bypasses the runtime suspend callback, leaving =
the
> > hardware regulator permanently enabled and causing a regulator enable c=
ount
> > leak.
> >
> Seems to me that this will need a more comprehensive fix.

Confirmed, Sashiko's right. v1 registered devm_pm_runtime_enable() after
gpio_fan_stop()'s devm action, so LIFO teardown ran pm_runtime_disable()
first -- gpio_fan_stop()'s pm_runtime_put_sync() got -EACCES and never
reached the regulator disable.

v2 moves devm_pm_runtime_enable() earlier so gpio_fan_stop() runs first
again. Sending shortly.

thanks,
Cong

>
> Thanks,
> Guenter
>
> >>      /* If current GPIO state is active, mark RPM as active as well */
> >>      if (fan_data->speed_index > 0) {
> >>              int ret;
> >
>
