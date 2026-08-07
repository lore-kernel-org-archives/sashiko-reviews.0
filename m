Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1899C376A19
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113268; cv=none; b=L5uz3+y1wNpxQBOlccDRRnCQfed7ZFguTTCqwht1g1OfnlivmpNr72g+ImJ/w3CknCgDIMqEvT9sxCmXGrAHENKMutCpXsd6x35OkYQe0dCCqrBYQzdSiLNJ5FnyKM4EdiJZkNuofos6fXuKvk7NS6dq5psLGLvo5g0FO8CJ4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113268; c=relaxed/simple;
	bh=mraH6v8aksAhesK9eG356Uif2nQEzR62+Ce8SxAKdG0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=M+CwpbFiem/tYqXX4kUFhit8PcQYwbyG7WsdxzbTEqzKX24O/wKZXSt5yAQr8p9nazEWxwrdBW/+Uef7Yb9UtX6QitLEQ87Tkz3FmcOskzFlInB92Izt2gKPFmm6rvyZPjq3UE4kRBfKjADCfV86/Ln32YLBhcKMVO47zqOHogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+Feo3py; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+Feo3py"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so40326355e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786113265; x=1786718065; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sGoO/Wbmk80pptcCMxW1FaIeOFPEzTpAp5ud70lvHlo=;
        b=B+Feo3pyZygp+Iqjkt272stGX5j2/2ReGeM7dK3ArQBt/WfGsu2bYh1ow6hW0UbfS6
         uX/dU5xI/oV9n/wjyGuEG6GxKj4+Mv/Se6KsLH/ZWS+tlvuko6oJCtxaJ1DbMLOheacV
         mZemx/kDhvs4aFpz5SJYJHCMnMXOUzST+5x936HJEnSCIIMNyUHmRfHrX0rMEyRGRqSQ
         u2WyAKMqAxIc7LAx74ENy4fekN1KRG9BWYUmokk1xUp/m+xzntG/1ZAHnkWT9kyX8mZ5
         pH77elnGCVIGW0XIVQRv3iFf1Ts9kQFBmin1VtSK89uuAzVpLIFHOw5AXLEI4d1RYNUb
         zJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113265; x=1786718065;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGoO/Wbmk80pptcCMxW1FaIeOFPEzTpAp5ud70lvHlo=;
        b=TYA88DeGe6pP+RaYeE5eTEfXeCPOBaABh/AzY0XZ549KMayjychZQbYL6ohcA64LMX
         YyvTAcVvsimlW0qF2DOjkNxjuZMvPc34pQEg9OANhLyUv0dIXpMZdiiZHIeEjhqDY6ES
         B9ra7lIXmOqcUut1toO7SxC92ueDi14Lw+ZXLkwaqrG0z0Ki0SdlIvmT3TBErEv40tY/
         T/GiN3aG2uLBiFS9zmhpehe6tn9BMv3LE2lY0HBtK1gZ/UYA32HOEGgrYBxB6KZRP/aL
         L821cAV4uJLqlbCy/xYPY8u27uiYQCDvLL4dVvPcceDR8qW5ClV15LZIPYXVUuqdtWOx
         Reng==
X-Gm-Message-State: AOJu0YyqGwd2vmJzGgFmbcydddKQUnkrZMxeAFEuWybQN7q1qjDR8DsI
	sHrZ+KxnP/VhjACIYWcMY8r7VICLfNRQng0wZNof7bYbIz3sc9emRvMD1UOTKA==
X-Gm-Gg: AR+sD10awVKKQ6aLHuuqwawxNPHyoFCxGQdMH4KsiKbkUoOsSiR18mU47qWPTLMoac1
	vb09C8Pr+e3AV71XEi+RPpjkonucy4QpAZ/j4ZRHkmSoCDVqz+0SZYtaT5yFatro5hShCUo/VLB
	qNniOBuEcoYUweCR3ykvLCjqoZAUjEVPDi8l44n7JEBJpV34zybEXxnId0AZ3MGJiL3j1UhcAlR
	koJ1pbLL41O8yHYeBKk5MLk26kBSQdxsUWQYhhKJAVh0mGwL6HbzgUEffsDSPpM89Zw77ETSRP+
	d1MsXp6FrukhPPrRWEjkvWUJxBm1faGG63pcGuncxXh17N2SHnaOY2ztd7I5kH0gY9mJzLeteUl
	iR30AWSXmWs7bSsebR3vQp1hnGcsGWcyrnvepiEeaB9BDsCT2jscSa/aptA4HTGKvJJQFlZynIx
	hWH5ikbzG57BVodSXnUpq7b73X7FX9sWdFuwX2KykTbKyoxtCWC3c18Mdcqz49mqp9cE8xb5kTI
	g==
X-Received: by 2002:a7b:cb95:0:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4994e7c118fmr229562055e9.11.1786113265021;
        Fri, 07 Aug 2026 07:34:25 -0700 (PDT)
Received: from localhost ([2001:4bb8:13c:7c2e:12da:15e:8c8e:cf37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421934asm163305435e9.5.2026.08.07.07.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 16:34:23 +0200
Message-Id: <DKISB5L2MJXM.S5JH6EXSRJM2@gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: iio: light: veml6030: add
 veml6031x00 ALS series
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-1-e60876fb3640@gmail.com>
 <20260807140640.80DF61F000E9@smtp.kernel.org>
In-Reply-To: <20260807140640.80DF61F000E9@smtp.kernel.org>

On Fri Aug 7, 2026 at 4:06 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The multiline `title` string in the YAML bindings lacks proper in=
dentation on its continuation line, resulting in a fatal YAML syntax error.
> --
>
> --- Patch [1]: [PATCH v5 1/4] dt-bindings: iio: light: veml6030: add veml=
6031x00 ALS series ---
> commit 8d68b2e616d3ddf21759545fea44ab122ecc25e0
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> dt-bindings: iio: light: veml6030: add veml6031x00 ALS series
>
> This commit adds the veml6031x00 series of ambient light sensors to the
> vishay,veml6030 bindings, updating the required compatibility strings and
> datasheet references.
>
>> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030=
.yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> index 0041e1db68388..6a387c76df353 100644
>> --- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> +++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> @@ -4,7 +4,8 @@
>>  $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> -title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Ligh=
t Sensors (ALS)
>> +title: VEML3235, VEML3328, VEML6030, VEML6031x00 series, VEML6035
>> +and VEML7700 Ambient Light Sensors (ALS)
>
> [Severity: Low]
> Does this continuation line need to be indented?
>
> Because it lacks indentation relative to the root mapping at column 0, th=
e
> YAML parser treats it as a new implicit block mapping key rather than a
> continuation of the title scalar. This results in a syntax error during
> dt_binding_check.
>
> [ ... ]

This is right, another device was added to the title between versions and
this 2-line title need two white spaces at the beginning of the second
line. I just validated it with dt_binding_check, and it will be added to
V6.

Best regards,
Javier
