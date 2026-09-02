Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C410360EEE
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374605; cv=none; b=eudL5jTqJs0ZK0tDN8gHfLOtMdCTATHSSyJRRXtg5Zr5ZCwFFNtFgZghabihtlwXR5q/epPo1CL3XyTXNerJodp7obUbI1fG+KEgNIdPonBTysuX1uEgg7xe98HmCGcHNNARGkG3JFBGK/CVs5G93FMKdQAqzyO9S6B9q+Q+Lgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374605; c=relaxed/simple;
	bh=5Keyffio6qVpCs5QPavKPlOqOswZ2klYgfP8rJs6TiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z+LSFTMbFhEy+M3WyTwA2OpAgF4MTYaKYyNYYGlt5iXKWlRy5zCAwBOtN4WMlj3MwqBiiJErufg/0xLiOg5Tl4wp4lK9tmpMLua/O0lg11XAM/HjIfu6CksIcg8IovzNCQj4oH9BXqWoZMeiN2waVl7YauL9+hkcQhljQg+3isg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lEJXhZ2l; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lEJXhZ2l"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1087842f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788374601; x=1788979401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWYYRVQBRJaK3NbpqrRL/6N4wYR6cMesVqAcJL7LMIY=;
        b=lEJXhZ2lEyolytukA6smzDx0VElclzuqEdjdZjTF5FXbt2T8pvUO5FDM79odPw/8Kv
         fy3IarJy6BuRCRn0K+/QFLPrpMUhVWrYBCZtbqyOATkolOuP5wx0zphIw3NA8K3K4MM/
         MGeoJKyzJrwVk9PPbFGR7jEPQxGVoJ5tT2dod2WkZs4IZ1AO/JCHg/oWkZ1x/XQe6S/H
         7zlWQ3XHMAFySGNb2InbU/wf6WMk2D6/iPtx7a+X3emtc10t8idyooLkeF0nUwTTBq34
         REXoeSazWZi+xAnWA798I449Yy63P1buq/h6ViKWayQRyR7sdzCPht2oi5lIki7rwChI
         8IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374601; x=1788979401;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWYYRVQBRJaK3NbpqrRL/6N4wYR6cMesVqAcJL7LMIY=;
        b=h9R3EBiG3sdO+nI+eTaRjmmBTibqZb56Uv4uUF4AMTOtbOguViAZ686FpUk0xzLlMC
         uQKCYoMnGUw5wKcEp0N6KTrm2zkvAhaU3epm+ftl7rugfWHEXQ1SngksAN93RA9Ne0bF
         o5nu/6X77CbKaBMDRUHkhP7fSqFkq2Ql+MIda7rFoUt9Gi2HFzxIzfK6QQ8IBmhXH40l
         dg3br7WjwhdqitJphKIIWN9fPmqIDMC0x/MQ2krE8KCgLhWiBgmgfiVYwmRSW9A9GSzf
         hGOudLw3ClEFp/shJZ9/MXB6UaPOBCLfckeXVFDoLmCSXxmVkmkzO42cYtbN7Sirx4gN
         vauA==
X-Forwarded-Encrypted: i=1; AKwUvBw8gRkoTE1eaKi8CiiZo/M7TVL0aK0Ev4wJHN0eXKrrL9OxGDTlPaiy8N133KXQbN57x+hHDw1N75S+BzuhTpE=@lists.linux.dev
X-Gm-Message-State: AFuF++lODlHiNRYubKY+14XLoh+09+ZE3jMtXl/blk3VFq2jMycfOwDa
	oNxEOhWp3EIeXcqL+OwqzCO4h1DJS5wDqCR5peZV+531SzqGJJP8Lk+ONsVwMNH/NWI=
X-Gm-Gg: AYBFou3Bdari2JqJsWsd/QH8MecZOTxUCMJs79WW3EmU8XRZ0NoB7DWTf/oibvDS13k
	7BT9qnwTaaCrMPs1rPhAgIBI/F4oMqIOFTBbZZnCnAZ5LfPAjLB39xg/MxQ3Po5Sf5HdFzsYbDm
	tFbz8+1PPXHnosmwAE0ZWDmb0XoFW6DPUOEiSi9waV6h4rDuFb4Ygt76RVcqHjz57PhylTVK2o8
	d+zwamzTzPsI0nXvBjWRgiz0tQ8N9MzZtVIrRAb52orIJqStCSKm1cjSjR1Ia5akSeEOlGgeMCe
	hbISYlAtfQ5PImG/SwsRfXILhVuuQh5RcPi6roGEbLUiGUs5JCtWTb0RS2788VRA12rykEGe12M
	a8LhtX3wsW4qLqn8JPq7QRt/vwu1uBwLXihu2V+2eesDwfyC+qf4ffennBYGRtH6VF+F2hbj5J+
	MyHfOgYlJhB0gpKB/IeQ5uIvi9UfhNTagrKY5JWxhCOghVSEBw6JiglGbwjoRvyck6pF/eFZnRR
	yDRv28=
X-Received: by 2002:a05:6000:1847:b0:482:fb9e:4e20 with SMTP id ffacd0b85a97d-48488dee407mr12111460f8f.6.1788374600680;
        Wed, 02 Sep 2026 11:43:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm8146112f8f.28.2026.09.02.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:43:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
 sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260827134235.GN770273@google.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <20260812214019.CDF921F000E9@smtp.kernel.org>
 <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
 <20260813095600.GA1072730@google.com>
 <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
 <20260827134235.GN770273@google.com>
Date: Wed, 02 Sep 2026 20:43:15 +0200
Message-ID: <1jld9j8pfg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 27 ao=C3=BBt 2026 at 14:42, Lee Jones <lee@kernel.org> wrote:

> On Fri, 14 Aug 2026, Jerome Brunet wrote:
>
>> On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:
>>=20
>> > On Thu, 13 Aug 2026, Jerome Brunet wrote:
>> >
>> >> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
>> >>=20
>> >> > Thank you for your contribution! Sashiko AI review found 2 potentia=
l issue(s) to consider:
>> >> > - [High] The corresponding regulator driver lacks support for
>> >> > `AXP318_ID`, causing the `axp20x-regulator` child device probe to f=
ail.
>> >>=20
>> >> Funny sashiko did not pick up on this when v6 was first sent. This is=
 an
>> >> ordering problem. The regulator part should be applied before the mfd
>> >> one.
>> >>=20
>> >> I could reorder here but there is not much point since the 2 changes =
will
>> >> land in different subsystems but it does bring a valid question:
>> >>=20
>> >> Lee, Mark, are you OK with picking the patches indended for your
>> >> subsystem or would you prefer that I split the series, regulator on o=
ne
>> >> side, mfd on the other (with a dep on the regulator one, of course) ?
>> >
>> > Does this break existing devices or simply delay support for this new =
one?
>>=20
>> Existing device are fine and untouched.
>>=20
>> I've just checked and if someone tried to run without PATCH 5 (regulator=
s),
>> the main axp driver loads fine but the regulator part gives this
>>=20
>> axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8
>
> Can you not enforce the deps with Kconfig?

This is not a build problem so I do not think Kconfig will change
anything here. There is no specific config per chip.

It is just a runtime ordering matter and not a problem. regulator and
mfd are split so at some point the support is incomplete.

* MFD first, it is fine it just cant instantiate the regulator until it
  lands. it is (mostly) useless without it, which is fine.
* Regulator first. regulator will never be instanciate until MFD support
  lands, just as useless.

IMO there is nothing to do here.

>
>> Seems sane enough if the regulator part is not present (and no board
>> using it has landed yet)
>>=20
>> To completly avoid this, the ID would need to be in its own patch,
>> then the regulators, finally the MFD. It seems like an unecessary churn
>> but I can do that if you prefer.
>
> --=20
> Lee Jones

--=20
Jerome
