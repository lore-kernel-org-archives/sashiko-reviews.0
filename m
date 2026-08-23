Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F283932EF
	for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787519661; cv=none; b=RmZldctAgUnikw7COIMaPeg5EFK03ao6siGaha5NQuUXLVMtT8ZrfG41C7cMvgwXKosKAoXm6m5mwtCP/UdlhCYCFEyWXrl91BeCX4uhE0lden+R0znJcD0sQikKqeWvUxx9wHFIZz4gAj+908u2Kp2e5W8CnyfYtp3+jejjrvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787519661; c=relaxed/simple;
	bh=GQcYsu1xlSX8MURf2JcqINcpimmeh2G5PKGU8mSo66k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hHDfycIe0jkx9RGEhG7/okWuAW8fNntwftmhYUshqHbicbS3tNDhU1xRaRE4ZUbmM334exZILE1G8l6D3RvW8pFWRRy7JmjaYIXMGd89BUGYsF28xa6bxA6wSMJZdRyZx065pU6JjlTqpH1Tm3DgB2wgWjVoPIrXPhgrXGyjYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s36Yqq9D; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s36Yqq9D"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15c42a45adso619991166b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787519658; x=1788124458; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GQcYsu1xlSX8MURf2JcqINcpimmeh2G5PKGU8mSo66k=;
        b=s36Yqq9DUpfqfKL7FnJ+f+DE3o0vQXRQXbQw1oqRnd6zSRlBboFjLW5WVwTfNjcdUj
         flRROLdXqO6ZOMeVyMCHa1+bWlvc1WgbZk720+pdOY2GpJIA0hQcHWKNd4k12Ab4CvF6
         ctVhls1L4BryhZ2ppghBnOG/6M9qkpizXGrLtpqtwVlDSIB4A9d5q6S14bnG3DB/Q12i
         4Oz46A+EF8LGN/0vbalI8HzQN1B5rEGKA6cUycVM2zJcO8D41iP8Nae0zGDsH3bhteKd
         5X2zRf4i5+MfawxeUzqtloIxBb6/fcKT3J/pCE+Zv8LTLzyMtn6mO+beZWvGAMomaq34
         CLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787519658; x=1788124458;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQcYsu1xlSX8MURf2JcqINcpimmeh2G5PKGU8mSo66k=;
        b=Ou8+W5uLVEEwWUQH5DWXn2XV1GoYdcGFN8NgCInKxIHE6lJQ49b5lOoAHZ7+k+phk9
         GpdgwFMWmVsPGDBCfbKoH74fWFdXTcARqqRiZ3tiVNF05YNC6sdTwIXYgmZu2+dYiuTt
         QFFPfp9Owd3jXxSQw1tiN6XFGQsZE1ZrQYRk5zXdkyu7YjZtXr9UWIiBeVSYM1XLzgiw
         PcjFCp6N1u1eVeMNb0wFVxdeqeObI84n92w0iTItIY4rLo+MZmqtwgRobgcOC/PHb9s4
         OUv5dn3D8p8o5cWU8+938uOqTUEUx7WvQt/FLWVwpSouOHg4p5VcKZh/mcASSaocN1+g
         ch4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoHJi6PWplxSWsbA2k8XBeVtPLQRixAw1Ct9t/bmrHi4GmZm0pBFxgXGHKy1bN1Bod1XVEpc93HjWvfx4BkOzQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nLp24vWCd4eJHofPH79QpYpQiyhOkCxnUQ7rFcYoAvddN8fZvo
	ek+QkomznoSWM4LB5XKZni0X8C2uRt9IBddMlwfFJgjnJJH/QV5EiWXZ
X-Gm-Gg: AR+sD12dI+ylsfaWe/arshxo/jmYYrLN1G7tmgR4hZAXPEFRNBKrO0VhF1XM5i77XUC
	W0Gm4xyuY9p7WFZS1msf26zZyjGO3bifMgsoVJ4CHWdOEav49gg4OuFDMqjo+JEbcM0Jf6Am+Od
	dRZoGLpSRGH0mHqYUuCWbyX17Fbb6bDcU/meVAchzbujk8uvRloeH1EDydn2OdwJao43+yMHUng
	qMcLHHHhdz7/umLAimP/aLDIVMK61hKqy4rD79fGHZIyVvvvufpLs/eNA+xPTzSgbtlg5FIAAGk
	tKImdTLI0UdYRA23ysM7bLAcfvzdvE5W3jBxxI8xfMOuXhvg1ESh5HkO4gF9GmqPfnkCaNTXTHd
	AcmWnb+j7midtWTmjpfSf6CSUb0xHT0zK8VT/6kvVZmwk0FK7UoloH9vxbKAFf/wVOyA82p4Y4y
	QgOu20CzzIgdfQYfwhjrsU+RVh3hzUNxAoJgiwE8ul4MoAXB9Sd4Fd7V8YoYcNKkthv9jLiqv0F
	zw=
X-Received: by 2002:a17:906:fe0e:b0:c15:c323:36e5 with SMTP id a640c23a62f3a-c244d7194bfmr2354385766b.10.1787519657837;
        Sun, 23 Aug 2026 14:14:17 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:9afb:3e57:222c:87c4:a243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e025158sm5483628a12.11.2026.08.23.14.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 14:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 23:14:14 +0200
Message-Id: <DKWMU0O7E1H1.3PISYTK05L7RJ@gmail.com>
Subject: Re: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering
Cc: <linux-hwmon@vger.kernel.org>
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 <sashiko-reviews@lists.linux.dev>, "Guenter Roeck" <linux@roeck-us.net>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-2-6a26c8e9e2fc@gmail.com>
 <20260823181259.AA12B1F000E9@smtp.kernel.org>
 <DKWJ6WKOYS9L.34QD4I0N2PJTU@gmail.com>
In-Reply-To: <DKWJ6WKOYS9L.34QD4I0N2PJTU@gmail.com>

On Sun Aug 23, 2026 at 8:22 PM CEST, Javier Carrasco wrote:
> On Sun Aug 23, 2026 at 8:12 PM CEST, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>>
>> New issues:
>> - [Medium] Registering the hwmon device before requesting IRQs exposes t=
he device to userspace before its resources are fully initialized, introduc=
ing a probe race.
>>
>> Pre-existing issues:
>> - [High] Incorrect endianness conversion on big-endian hosts for SMBus w=
ord writes results in writing LSB first instead of MSB first.
>> - [High] Dereferencing a potentially unaligned byte array pointer using =
`be16_to_cpup()` can cause kernel panics on architectures with strict memor=
y alignment requirements.
>> --
>>
>> --- Patch [2]: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering=
 ---
>> Note: The standard review format has been altered and direct code quotes=
 omitted to comply with recitation restrictions.
>>
>> commit 28a819427451e0b54e63443c10cc5e1979c146bb
>> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> hwmon: chipcap2: fix IRQ teardown ordering
>>
>> This commit separates IRQ discovery from IRQ registration in the chipcap=
2
>> driver. It ensures IRQs are requested after the hwmon device is register=
ed to
>> fix devres teardown ordering issues.
>>
>> [Severity: Medium]
>> In cc2_probe(), the hwmon device is now registered using
>> devm_hwmon_device_register_with_info() before cc2_request_irqs() is call=
ed.
>> Does exposing the sysfs attributes before the IRQs are requested create =
a probe
>> race?
>>
>> If userspace applications interact with the sysfs interface immediately =
after
>> registration, could the read fail with a -ETIMEDOUT error because the de=
vice
>> is waiting for an IRQ handler that has not yet been registered?
>>
>
> I am not sure what to do with this, as this patch was actually meant to
> avoid the opposite issue (IRQs still available when the hwmon device is
> not) which is worse because access to freed resources might arise.
>

Both issues can be fixed at once by registering the data ready IRQ
before the hwmon device because it does not need it.
I will update it for V3.

Best regards,
Javier


