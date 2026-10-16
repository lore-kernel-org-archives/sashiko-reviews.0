Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638FE396B6F
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140859; cv=none; b=s1N1el85237Ks1iD9UhuWJvujIuZCSkrVrOT/QUIBU2NGTkmfigXUcmnyEeY10ua2PgfO+askIg9Km8LxSmCB6ugXDfdKhwz52XYK2rGKOvn/2lRcl8mfy50MoSyJSvLG5/oylrKKf9eDNoCpCDQwXJa+rQQQ+Mtwt4qw7aQgiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140859; c=relaxed/simple;
	bh=Q6kJg9YnEj9SJP+ZKrekeHRKk3Z0bOEtF15KexR6AkM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnTvlyRtSz/m8DGqD6skZHw3jLInNDpZclPewgNnjrukb7jRbN+HGK4nxkYcGRdxxswDA2n32NITYyoygc//BacKzZFjmucbYrooX9uepxMAW1IY7fUnJ/AMQ3Q1kObBS1COQ6DJrLqptpxaRtiendVpR5d8hqhSyZ+zIVIXKMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxjB5lYY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxjB5lYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1AA1F000C7
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792140858;
	bh=BxSPoAf5Id6w0Ha25Hqpvqjx9PtDS2md8/0rLJ8pBO0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZxjB5lYYFlsYaAlCabcsQI7KbpzFzWqJHR/rXtpZfDaVQuezD7gIkTrcO674W3yJ6
	 oT+/BBXz0cyY0K4PVS92lpkgIq2MSFXmrEdhuUFjOZDaWLTVavpX2HxcBiir72kfGF
	 5UTa9AKuNdhDTRmm0v63vxurkpNsQ6tbX9NyHrOyslULAmA7A4xcjsFba27ZYKUTGo
	 ItBiIXn8011WAaoL1WDcTCpHsflwQMXGGCjuFBbZ3nWyMdl66Y6s8F0uedJl8UlIbd
	 Pj1NijeM7b0YzmIZ8Fg0aEuEDeF1Xr+vmxLN1+U3S6DRfAUzKkfr6LWXzjcFckKfpD
	 M4HQPNZCllguw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3aae7df0971so11122481fa.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 01:54:18 -0700 (PDT)
X-Gm-Message-State: AFq9FYJ2SxWmZtnvgiddmHZOTtW6vhMBn18Va2kFQgY8ruYdaHtmzUcf
	CaVf4q//CRGGty5NIoqwUKA+/HWixARmXI9p7dBtPbFPvA7F50oWpeSbXneZ3Lkckp8rDISDh06
	RPI0PS693aj0Za0Q/sdrJauOdVw2jkgU0VGor8jdw3g==
X-Received: by 2002:a2e:be91:0:b0:3a9:787a:139c with SMTP id
 38308e7fff4ca-3a9c5714367mr52956681fa.25.1792140856737; Fri, 16 Oct 2026
 01:54:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 04:54:15 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 04:54:15 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <sashiko-outbox-174010@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261016-gpio-sim-const-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com>
 <sashiko-outbox-174010@kernel.org>
Date: Fri, 16 Oct 2026 04:54:15 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdEmjiF35o6tedObEiuA=OhvOq=0oNeRid3KemHAviL-Q@mail.gmail.com>
X-Gm-Features: AclHuK-eV0zNLgZ88T5o5RnHwxcMcnGUvuJxCGetFR_cP8YKHQeenGxGzJN_Ylc
Message-ID: <CAMRc=MdEmjiF35o6tedObEiuA=OhvOq=0oNeRid3KemHAviL-Q@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: sim: access sysfs attributes as const
To: sashiko-reviews@lists.linux.dev, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: sashiko-bot@kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 10:19:13 +0200, sashiko-bot@kernel.org said:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] gpio-sim: incomplete sysfs attribute constification
> --
>
> commit 055dde35eca9fff8d54ca501f4fca6d98889dfd8
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> gpio: sim: access sysfs attributes as const
>
> Use the const variant of constainer_of() to access struct
> gpio_sim_attribute which wraps the dynamically allocated sysfs
> attributes for value and pull of simulated GPIO lines in line with the
> currently preferred approach.
>
>> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
>> index 0c73bec042670..e0ae586cd08d8 100644
>> --- a/drivers/gpio/gpio-sim.c
>> +++ b/drivers/gpio/gpio-sim.c
>> @@ -59,10 +59,10 @@ struct gpio_sim_attribute {
>>  	unsigned int offset;
>>  };
>>
>> -static struct gpio_sim_attribute *
>> +static const struct gpio_sim_attribute *
>>  to_gpio_sim_attr(struct device_attribute *dev_attr)
>
> [Severity: Low]
> Does this function signature need to be updated to take a const
> struct device_attribute *dev_attr?
>
> Since dev_attr is still non-const here, the container_of_const macro will
> evaluate its non-const branch, resulting in a non-const pointer that gets
> implicitly cast to const by the return statement. This makes the generic type
> selection of container_of_const largely redundant.
>
>>  {
>> -	return container_of(dev_attr, struct gpio_sim_attribute, dev_attr);
>> +	return container_of_const(dev_attr, struct gpio_sim_attribute, dev_attr);
>>  }
>
> [ ... ]
>
>> @@ -272,7 +272,7 @@ static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
>>  static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
>>  				       struct device_attribute *attr, char *buf)
>
> [Severity: Low]
> Should these sysfs callback signatures be updated to accept a const struct
> device_attribute *attr?
>
> The callbacks still accept a non-const attr parameter, meaning the refactoring
> to const attributes is incomplete.
>
> For a full migration, the callback signatures should accept const struct
> device_attribute *attr and be assigned to the appropriate show_const /
> store_const function pointers in the attribute definition.
>

Well, I guess that answers the question of whether there's more to do. :)

Bartosz
