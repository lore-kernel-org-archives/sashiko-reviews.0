Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905957;
	b=jgX0K7Eq4KHRR4CyEqRW4pGhXwrlE5eMPLpQyaWlPnmVrolCaGsQm/h8uPwvDGvFxIXz
	 J4SND56zuGxjQrJHKwqEcW1Wj3zvp4L+fhA8XWIMPjdcnNNegBAbmRnnkmvav81vLVL54
	 NT8p5bJkvwsNGmlFlOF5lNMW6NViBL/9M8hVEU0kt04HGB58CA0ZApRpSZDiLtZPEPsWL
	 pwy+PVi//Spi/+gxu06mmmI5JtpqkSGzaFYNML96KzP93D2kG3Gfw2W6YCzuuTwQkGg5U
	 TgPL9ecNaIFsfo/lKiHFkCbN2JWdBjgMhGHjqrzb9hMNhppJp5kekuBmiwuYrTh8Dlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=y8P+WoCobFB7rgWkL/XYrODvnkiB2lim4Wv3M4Ag2eA=;
	b=0TY4C8M32UihNMOWgiW14J9EK9XX4zlT/X39QIthTphplxB6L+pkFYUly1CA+Aoja6oa
	 tjlie2OXIv99dz1SNGgPdMfDYGYCCn5qhHtlGDyNGh3xcvn0bV3EI8BGpk0VT0eRKnozb
	 i/UjKbFUfg9hjSZu0eEqQUlAezfsLhdF2QgWpR8qwZEP06a6bNpc9FKU8xGg5IEkW+INq
	 20v/smJrSXuc3RdVPrLFqF6565L2Z/6cR6KNGDZQgVdxzMHnmWHyxShEvMdMX/dfd++iA
	 Oqlhw8RWW43meMCJJEFada1PyvZ9N3rvM63fsZ2pFjaRIJqBFAgfJri5bK7/1zWjxjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGHCYUiH;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4140606A33B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 19:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4140606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGHCYUiH
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b331cad3cfso6768497b3.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 11:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793905956; x=1794510756; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y8P+WoCobFB7rgWkL/XYrODvnkiB2lim4Wv3M4Ag2eA=;
        b=rGHCYUiHmpD86rdFFOuZwvRJBHjGG/gHnfTso8clKrrTU6Z/E9EPdu57J/dxHLCvvT
         6Hm/7pJAu+GUY8b5jG4gJLVaEfJ9NA2ylALm4vnQ2iP/ErD0Pnh3rIG7Kz9V6UdusYbB
         Cui29RK1oX0OZ+QqdZX2WOuZWz8ToUDDdseDf53QmmVyNqszoP0xavKKwEWxh4FV4UxF
         XcOj2bjESRaqdjOSAbCV7Y/nhcgclnZ5ghry/ixqwrUTxvQHIvE4CSrAwRpFTfJtYSqs
         C8kzX0VQ7FqqOFEVmQCSme+RIM3LuOvm6mKU9v205qYG3zYlEdd3vMc2YtTZUmd5GHUx
         UTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905956; x=1794510756;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8P+WoCobFB7rgWkL/XYrODvnkiB2lim4Wv3M4Ag2eA=;
        b=ZrFNZOugAnpO+UgXkbugZbKHe/wwNscV8EfnklsHMQwnyhwwzxxcLVInsG5X9LeySX
         lc2X+Hr3ax9QTqU5KhGtQlutJzNf5rR0C2dluS3iDPxvpNBO2WeBmc3NfehOJJI37BJS
         d83uCu3GsWcwvByv8nDoQ8wMFape8cAvaB9+x3uYsedaFFipGPBV8CmdH2ZUP23JmJ3/
         6pEh6Kph5qtNRXFzMccq4XXGjDqtlSxOtR5g0qyaMa0q1hQvGwAz1CzDRrxeDodh7beR
         R4rtU8intlvNvmRZqRy5PksQBdn32odx8dW0x8xTdZaqJZOJm0sgvEbHru6D2duESWSA
         MVtg==
X-Gm-Message-State: APuU4Z/wyhgYT2Uwinrh2ongaBZdlntv49yOVxxSS21RHGzXkS9cJ5e0
	YGSlf110QaI7SssgAWrTZI3RbS4Hm/GClI30neEh31UR6aeznVePG1Iytsi5
X-Gm-Gg: AYBFou3IFSPTwkF2CG10aJ6PLouDxFU3CtR5ajWkJ/54TOwhrQcPxBkv1icNEpZcKfw
	isp/HliW4rEZeJza0UC4u8H2N00Uty/Ye71OZrJWFQBkw6Brup5CoYMh/o6kKCAxxvSTIUc9dzh
	FKy/MWt0Q4lysNN7zatEo/QRaCe7pFzUW5VSUAvRUPT23px+oxQK3lSZB/rG3qvqnheG1FOhOlu
	AW6JmYDmswdcWJuKStv1GfdSj57+FlJIqUjH+F8l+81nEe7t32yVkOt22MKqweKO899VMRgfAbn
	yJ2AmdKD3RqZMcBKn5go9hZD442M3DLKolDoS4O2fxFZbRZT4S5WEk+YX1+ikT1DaNu9fWudgLE
	4MUN0GRyHj0LuqeRch6HvbVphLSOlB5KkJkanAohpvd+j+ZWtMBy/8woZIkeehKEhP3+l2OkM/+
	PlzeKV4YkLNCqZ96uX3fmPVQHdKVjthmAq9EN4nusoGxu/FTFpmAJV4FPt4j0ZtgSk+CXARdVpD
	rQJhb4ofeo98rerje1kHTXteMhtWEeZ1Gy/Fgb2mMCawbCLZC51mtKNMPUV4rvIw6EXTJvHR20H
	46orZ3wvixflsVx13vMOOhCE9GQgYae/aLmXJ6R3MQ5o4hgN7/XD6myj6m2LZ1+y
X-Received: by 2002:a05:690c:c510:b0:8b3:2a99:55d5 with SMTP id 00721157ae682-8b32a995d6bmr19870087b3.10.1793905955435;
        Thu, 05 Nov 2026 11:12:35 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f773239sm2235287b3.15.2026.11.05.11.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 11:12:34 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 16:12:31 -0300
Message-Id: <DMNIL4ZYZWLZ.3K6BK08P4SUD5@gmail.com>
Cc: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v6 2/3] drm/ch1115: add support for Chipwealth CH1115
 OLED controller
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.20.0
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
 <01cee5640e8637cbe0cd49e920f3aeed2c60640a.1793735996.git.nico.antinori.7@gmail.com> <sashiko-outbox-196034@kernel.org>
In-Reply-To: <sashiko-outbox-196034@kernel.org>

Hello,

On Tue Nov 3, 2026 at 6:05 PM -03, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] drm/ch1115: out-of-range display offset 64 sent in ch1115_oled=
_init()
> - [Medium] drm/ch1115: missing DC-DC disable in ch1115_encoder_atomic_dis=
able()
> --
>
> commit e5268b4f2a7c534421925bdee0145caf63c50632
> Author: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>
> drm/ch1115: add support for Chipwealth CH1115 OLED controller
>
> This commit adds a DRM driver for Chipwealth CH1115 monochrome dot matrix
> OLED panels connected over I2C.
>
>> diff --git a/drivers/gpu/drm/tiny/ch1115-i2c.c b/drivers/gpu/drm/tiny/ch=
1115-i2c.c
>> new file mode 100644
>> index 0000000000000..08fee5a09f4f9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tiny/ch1115-i2c.c
>> @@ -0,0 +1,859 @@
>
> [ ... ]
>
>> +static int ch1115_oled_init(struct ch1115_device *ch1115)
>> +{
>> +	u8 commands[] =3D {
>> +		CH1115_CMD_OFF,
>> +
>> +		CH1115_CMD_CLOCK_DIVIDE_RATIO,
>> +		CH1115_VAL_CLOCK_DIVIDE_RATIO(CH1115_VAL_CLOCK_OSC_FREQ,
>> +					      CH1115_VAL_CLOCK_DIV_RATIO),
>> +
>> +		CH1115_CMD_MUX_RATIO,
>> +		ch1115->height - 1,
>> +
>> +		CH1115_CMD_OFFSET,
>> +		ch1115->flip_vertical
>> +			? ch1115->y_start_offset
>> +			: CH1115_MAX_HEIGHT - ch1115->y_start_offset,
>
> [Severity: Medium]
> Does ch1115_oled_init() send an out-of-range value for CH1115_CMD_OFFSET =
when
> flip_vertical is false and y_start_offset is 0?
>
> In ch1115_parse_dt(), y_start_offset defaults to 0 when the chipwealth,of=
fset
> property is omitted, and is otherwise restricted to [0, CH1115_MAX_HEIGHT=
 - 1]
> (0 to 63):
>
> 	ret =3D of_property_read_u32(np, "chipwealth,offset", &val);
> 	if (ret) {
> 		ch1115->y_start_offset =3D 0;
> 	} else {
> 		if (val > CH1115_MAX_HEIGHT - 1) {
> 			dev_err(dev, "chipwealth,offset=3D%d must be [0-%d]\n",
> 				val, CH1115_MAX_HEIGHT - 1);
> 			return -EINVAL;
> 		}
> 		ch1115->y_start_offset =3D (u8)val;
> 	}
>
> When ch1115_encoder_atomic_enable() calls ch1115_oled_init() with
> flip_vertical set to false and y_start_offset set to 0, the expression
> CH1115_MAX_HEIGHT - ch1115->y_start_offset evaluates to 64 (0x40), which
> overflows the 6-bit [0, 63] vertical offset field instead of wrapping mod=
ulo
> CH1115_MAX_HEIGHT to 0.

This is a false positive, the datasheet [1] states that the formula for
this command (D3) is 64 - n, where n is a 6 bit number in the range [0,
63]. I did not use a mask for this because the unused bits get ignored.

>
> [ ... ]
>
>> +static void ch1115_encoder_atomic_enable(struct drm_encoder *encoder,
>> +					 struct drm_atomic_commit *state)
>> +{
>> +	struct drm_device *drm =3D encoder->dev;
>> +	struct ch1115_device *ch1115 =3D drm_to_ch1115(drm);
>> +	int ret;
>> +
>> +	ret =3D ch1115_oled_init(ch1115);
>> +	if (ret < 0)
>> +		return;
>> +
>> +	u8 command =3D CH1115_CMD_ON;
>> +
>> +	ret =3D ch1115_send_command_list(ch1115, &command, 1);
>> +	if (ret < 0)
>> +		return;
>> +
>> +	backlight_enable(ch1115->bl_dev);
>> +}
>> +
>> +static void ch1115_encoder_atomic_disable(struct drm_encoder *encoder,
>> +					  struct drm_atomic_commit *state)
>> +{
>> +	struct drm_device *drm =3D encoder->dev;
>> +	struct ch1115_device *ch1115 =3D drm_to_ch1115(drm);
>> +
>> +	backlight_disable(ch1115->bl_dev);
>> +
>> +	u8 command =3D CH1115_CMD_OFF;
>> +
>> +	ch1115_send_command_list(ch1115, &command, 1);
>> +}
>
> [Severity: Medium]
> Should ch1115_encoder_atomic_disable() also disable the internal DC-DC
> converter?
>
> When the encoder is enabled, ch1115_encoder_atomic_enable() calls
> ch1115_oled_init(), which turns on the DC-DC converter with CH1115_CMD_DC=
_DC
> and CH1115_VAL_DC_DC_ON. However, when the display is disabled via KMS or
> during system shutdown via ch1115_shutdown() -> drm_atomic_helper_shutdow=
n(),
> ch1115_encoder_atomic_disable() only sends CH1115_CMD_OFF, leaving the DC=
-DC
> converter enabled.
>
> By contrast, ch1115_remove() explicitly sends CH1115_CMD_OFF,
> CH1115_CMD_DC_DC, and CH1115_VAL_DC_DC_OFF after calling
> drm_atomic_helper_shutdown():
>
> 	u8 cmd_list[] =3D {
> 		CH1115_CMD_OFF,
> 		CH1115_CMD_DC_DC,
> 		CH1115_VAL_DC_DC_OFF,
> 	};
>
> 	drm_dev_unplug(&ch1115->dev);
> 	drm_atomic_helper_shutdown(&ch1115->dev);
>
> 	ch1115_send_command_list(ch1115, cmd_list, ARRAY_SIZE(cmd_list));
>
> If ch1115_encoder_atomic_disable() sent CH1115_CMD_OFF, CH1115_CMD_DC_DC,=
 and
> CH1115_VAL_DC_DC_OFF, wouldn't that properly power down the DC-DC convert=
er on
> both KMS disable and ch1115_shutdown(), while avoiding the duplicate comm=
and
> sequence in ch1115_remove()?

I believe this is accurate, apologies for this oversight. I have a local
version of this fixed, tested with modetest, unloading the module,
rebooting and power off the system entirely. I'll send a v7 in a few
days in case there is a review.

Best regards,
Nicol=C3=A1s

[1] https://datasheet4u.com/download/1576606/CH1115.html
