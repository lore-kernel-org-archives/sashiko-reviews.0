Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216203;
	b=arexomzjOeac87XwjIbZ/NlTZU34hE8SPk4CDK9NyZ6+ZIEi618j/k1aY0W+Yx2L42uJ
	 BiZTBOaFmn/Q2qoj1ZOUbzN7kGZp2lAK3p7AKduGsGbKAMjPcE6rJ1cQH9xFtyFZS/Ovj
	 S2bN9hNst1m49pxYDGZyc5G7EIKV7LQfx/N/4/MJ29Zs5LquVorBKbcP2Vij5waK9ocV1
	 IQ6b9o0sYzKDkutDBRWLEIoTzJIBqUK07z9kkNfzXOrCNKPzitSSoPv4Hhz9x3jFswl/2
	 JokH6M92IOeb7l1sxKpf6OyaEZyoepi9hN6mdsK72Ji8+oFnD20WgOCp6gMDaaoOFAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
	b=IOvYP/tvHY7Xc1nnG6UCN8vKOM1JtYFRg7F5e7R0Ub8il6KP+dqFz+D0+0XwAM5BiIez
	 gG2Mr2ANx9bcwywgCwr9oZvkYSdTrmTSujoM305OyC+6a2TABRI1/e4hz5DAdslMjAVVM
	 T8yKCBH7l5ksuUkZw/pImvpO6l0DdICp1INqdO+mJsPbCXpxZDIKyVKKwjQ0RwK050EFg
	 lPKVu+niGEYToaxSDa9H4WuZyIj4xXAYys48UKAwYWyE3AJZmknCo7R8EBla+Zr6Z3pup
	 QjX0P1Yy0ivT0rGEyfQPiwjzQ8VlSc07vftCX+ECk4rqoWMdP7nifsxdGKwCee/pCdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PCZOQ9fx;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08933606A68F
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 23:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08933606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PCZOQ9fx
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50933bdf4bso332887766b.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 15:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795216201; x=1795821001; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
        b=PCZOQ9fxzKF0YRxZRnHla6Xk3FqiL4p3BERp+wYDlZA0pumQPff44GfhEMkxlVX+iK
         xvUh1lfVKrijGoOi1uSgeu+5Ccl7Qir7kStjKiVAhMJeizfVna6lSIrp6zbTl6VjNKa5
         1wGD+9zWnUtDzLD2Jj7h4AjouCjv9W0E9ZcpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216201; x=1795821001;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
        b=JS9bh34t1uuSsRqLN3NsnuYdp7GXwE8aA6Fip7TBlrtO+WgT4f1yxNJr8xbozvEuDq
         +0v5S9oRTgJDXs1T7GJ0rurKh3aiXS8bPVU/owQQwmdG+olA31NWK4h1KK8ubPfijcgK
         KzqGlzk8lB0WbhDybzuYVJ5FrQ6zmxvfzFa/uJ5EbyNoUzRxQ3N8vs21wgFmJxCiAcAP
         qEfGbYV3AnAn2rs/wcggK5ET207pTfvFiEvBQpexLoVZDIKNgFbBPeGa/1knxSfSj4Qi
         ibujflfVSeBSJTak7dx0shTmkx8zXilMMhACKNqQ2/AuYVbLhDO0L5l1qN1e1DB0FhDi
         rlww==
X-Gm-Message-State: APuU4Z9KbxVIvG4mlUv1DjLHXDZ4m7ctkQub0gDR6Ta0x89N4r80TOGj
	ay7x9bLOHZZH2WPAsG0dE+ByhMToZWsAUuS2yVfh6TSL5PfosaNfZZbaMTe0MPfqdoel+UbJjTf
	3ROf1ypIU
X-Gm-Gg: AYBFou1zfnIzEVt78pH73Zbfnq5sx3GoTZ0gDQHFPQp/CbH/i8DCB+xamlvHLZKSRPe
	Chrx1Xq85u8XxGWOk443+eXeVhDNxknZvTAx5HlqJp2ZJqYWFbodJIci12hR5hYAO97xUXGC8NB
	3Aiu0QEJhApPsH8UizwMXcUgX2bIf9jFAm/ZcCqfQuup/d8Gw82pYUu3jHRK/9IeAmGnXNn1gDL
	pI0K7jOSBsyLGfwjR2mpRh/mt+qgsUg0SIpFbVSz9mvRxeC2zUQMYZOclmju9etFSbg9LWbi1+v
	i3GxZaFtXluBCAK7QORP3wbqZqlJPmhEr8hyTyL9pXSE11eZsIuAclr5psToPQRPqBb79mO9vVJ
	svQoTq98boy286byRWPBkKT0+ezzSpejmDISDRxI//MY7tLyD6FI5fYfKi6MUmXgrL8VwY845/s
	byY61cjR+yTVZ2mkGj8rna6offT5bnYAp9hcQXM3qzsuaCI+ADQ5DePW1BSxqIb94WPifHtXgDj
	7QqXuf1zylQB/2w6kC3AtSYbclkF4hHqxKNIuqIx9NL+E0uVuHrd0udwrNJ2lxQT/ftifI7imCt
	2ERE/MoKPhQJhOuwfJOs4foz0DxFshQVrDGcaeXXug4tOf4r7IvPgSyKieQITfQOf/vf
X-Received: by 2002:a17:907:e106:b0:c51:3382:8ff0 with SMTP id a640c23a62f3a-c5133829107mr423550466b.12.1795216201440;
        Fri, 20 Nov 2026 15:10:01 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae65965sm144743266b.23.2026.11.20.15.10.00
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:10:01 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40e30c26a4so545242066b.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 15:10:00 -0800 (PST)
X-Received: by 2002:a05:6000:2c05:b0:48e:6651:5956 with SMTP id
 ffacd0b85a97d-4aa488c85eamr14307450f8f.0.1795215881201; Fri, 20 Nov 2026
 15:04:41 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.3.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid> <sashiko-outbox-215034@kernel.org>
In-Reply-To: <sashiko-outbox-215034@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 15:04:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VqHE5PjK1vFbv73G1UaN_BwxvRJjUJbHVB=9wL_h9PDg@mail.gmail.com>
X-Gm-Features: Aa3M54qr05eSVV9PwOwJNdqAzu1uH37TTf3Dyh-iO_tgJlOvdvevguI12yuhb0E
Message-ID: <CAD=FV=VqHE5PjK1vFbv73G1UaN_BwxvRJjUJbHVB=9wL_h9PDg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] kbuild: fit: Add opt-in FIT_FACTOR_DTBS
 support using fdtfactor
To: sashiko-reviews@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kbuild@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Nicolas Schier <nsc@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rong Xu <xur@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2026 at 1:09 PM <sashiko-bot@kernel.org> wrote:
>
> [Severity: Medium]
> As reported by Simon Glass on RFC [1], can composite DTBs built via
> cmd_fdtoverlay reach fdtfactor with incomplete /__local_fixups__ when
> FIT_FACTOR_DTBS=1 is used without FIT_DECOMPOSE_DTBS=1?
>
> Although DTC_FLAGS passes -@ -L to dtc for the base .dtb and .dtbo inputs,
> fdt_overlay_apply() in the in-tree scripts/dtc/libfdt/fdt_overlay.c merges
> __overlay__ and __symbols__ into the target DTB without merging the
> overlay's /__local_fixups__.  When FIT_DECOMPOSE_DTBS is not set,
> make_fit.py packs those composite .dtb blobs into image.fit, leaving
> fdtfactor without local fixup entries for phandle properties originating
> from the overlays.
>
> Until in-tree libfdt preserves overlay /__local_fixups__, should
> FIT_FACTOR_DTBS imply --decompose-dtbs (or reject composite DTBs when
> FIT_DECOMPOSE_DTBS is not enabled)?
>
> [1] https://lore.kernel.org/r/CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com

Rather than trying to handle older in-tree `libfdt`/`fdtoverlay` (and we
wouldn't want `FIT_FACTOR_DTBS` to imply `--decompose-dtbs`, both
because single-base composite DTB families would leave fewer than two
non-overlay `flat_dt` nodes for `fdtfactor` to factor and because
bootloaders like Pixel 10's expect a single base `.dtb` plus a single
per-board `.dtbo`), this series will remain RFC until the `fdtfactor` /
`fdtoverlay` `/__local_fixups__` changes land in upstream `dtc`. Once
they land, the first patch in the non-RFC series will update
`scripts/dtc/` so in-tree `fdtoverlay` preserves `/__local_fixups__`
directly.

I had only mentioned that in the notes below `---` on patch 3/5 rather
than in the cover letter; I've updated the cover letter as well so that
plan is explicit if another RFC goes out before the `dtc` changes land.

-Doug
