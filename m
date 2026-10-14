Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D014A6CE4
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967531; cv=none; b=DxTC+W5eCheVIqH5cATsABoeTZRrNkqJpU5YaaRDw+wuuFIPzC/hjsQPmEw/65X6kiFhlzh6oiuGpLXPuE4cF1j2z8B/CPx0e4miEO0gs3NwloR5tas1eerIusyv94avigMOMYqlymRra9ysIkEGcKp7QXLcDl98phcPAhsjHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967531; c=relaxed/simple;
	bh=M3XrbzS52MAPzm9pEt+8BHV3SioCM+61I/a7UKE0+Ao=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4JpCxxNFvjgLXXPBy6EfxIVYBV63nK1NDhLXlxolQzHdCcGuLQk7tUaypwGh8UUr9DBwS4EJLpsyXgoTPWuoB/b13Ky0HVY/7fqioPz7loylOIhdEc8kc4wORYj/mf8aT86J5kEYyU/Zt/1tLUaaAjcyOFTgH1xcg6lcrt7R4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huWt9jTM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huWt9jTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600AB1F000FF
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791967530;
	bh=IHthPZKXlvkg1esCWSbqRA+eNslXiqM7gXODTvSRuUg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=huWt9jTMwNgalqFN9uT27ukrywBxtMZx30OPfwChVx3JWvbjMhkpBFQ1jF6plpTFz
	 y2ttqhBN4Ar9aK13MXHI93Gk+7GwuyQm5dcW6kiiLicf0xf+XDvneuvRxwoLpxcmJ0
	 gtZP4h701LVIYD8URHEoyZs/SN9swNVKKPSMpQqGejQCMwhHc5KA5BnhsbArH//NjO
	 kfEU9JSDtB2w1aAMfj6oAeNq2RpBm1ZpJVdKTAHi2jsKQBRcDl8Ko9HkfPtoB2MFzi
	 d8n6kwAuUBk8yxtx7/oWV14vZ8emWt/QpocmcPlCC1SJDKkeF5bRKdzGaiiG9K96xc
	 cQHvL7oWRJeMQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso163025e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 01:45:30 -0700 (PDT)
X-Gm-Message-State: AFq9FYKc8IC//CKwK7mfsoMYqhqV9G5k2DniDgXeAKezPzzcNI7QqrTc
	vM0pNqCCf36+nhLl6xiqFgAU7hetuL7SL/GMQD2Z3JbgkoZ1nsELGVrzK9ZMJwkUiiWMTHSMCuS
	oaz/McogCqHF4Ywy5KqBbuQzem4+6rFr2nfeCN+TYzA==
X-Received: by 2002:a05:6512:15a6:b0:5b8:c04b:27ef with SMTP id
 2adb3069b0e04-5bcde35db28mr5213296e87.5.1791967524158; Wed, 14 Oct 2026
 01:45:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 01:45:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 01:45:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <sashiko-outbox-169786@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
 <20261013-gpio-kunit-plat-lookup-v3-1-3907f913e964@oss.qualcomm.com> <sashiko-outbox-169786@kernel.org>
Date: Wed, 14 Oct 2026 01:45:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md8n+=SNJHQ4dDO5y0XK8eD8Nyi9ypHN3Hc5AFrs4b0Tw@mail.gmail.com>
X-Gm-Features: AclHuK9nV1b6gYwmGxwS8RlsUlswNsr2mBomDNJvocRAAhNNeKfLIlHx9aPUgGE
Message-ID: <CAMRc=Md8n+=SNJHQ4dDO5y0XK8eD8Nyi9ypHN3Hc5AFrs4b0Tw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] gpio: kunit: fix the label of the dummy GPIO chip
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 15:14:30 +0200, sashiko-bot@kernel.org said:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] gpio: resource leak of gdev on KUnit test assertion failure
> --
>
> commit b7e40967a53cb1589f5bac90dea8c80d8d27bce0
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> gpio: kunit: fix the label of the dummy GPIO chip
>
> The label of the test GPIO provider is currently set to the consumer
> name. Use the provider name instead.
>
>> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
>> --- a/drivers/gpio/gpiolib-kunit.c
>> +++ b/drivers/gpio/gpiolib-kunit.c
>
> [ ... ]
>
>> @@ -780,7 +779,7 @@ static void gpio_hog_assert(struct kunit *test, unsi=
gned int offset,
>>
>>  	/* The hog must have configured the line with the expected direction. =
*/
>>  	struct gpio_device *gdev __free(gpio_device_put) =3D
>> -		gpio_device_find_by_label(GPIO_CONSUMER_NAME);
>> +			gpio_device_find_by_label(GPIO_TEST_PROVIDER);
>>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
>>
>>  	desc =3D gpio_device_get_desc(gdev, offset);
>>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
>>
>>  	ret =3D gpiod_get_direction(desc);
>>  	KUNIT_ASSERT_EQ(test, ret, expected_direction);
>
> [Severity: Medium]
> Does this code leak the gdev reference when KUnit assertions fail?
>
> If KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc) or the subsequent KUNIT_ASSER=
T_EQ()
> fails in gpio_hog_assert(), KUnit aborts the test thread immediately usin=
g
> kthread_exit().
>
> Because kthread_exit() bypasses normal C scope exit, compiler-generated
> cleanup handlers like __free(gpio_device_put) are skipped, causing a refe=
rence
> count leak of the gpio_device.
>
> This leaked reference could prevent the dummy device from being properly =
freed,
> which might wedge subsequent test runs or module unloads.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-kun=
it-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com?part=3D1
>
>

Fixed in a follow-up commit:

    https://lore.kernel.org/20261014-gpio-kunit-autofree-leak-fix-v1-1-5bfa=
7be0eb1f@oss.qualcomm.com

Bart
