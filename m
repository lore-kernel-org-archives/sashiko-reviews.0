Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436641;
	b=KMlIy5RCgWUV+GDOqwubJc5bQkEZ/bxpE0xouS0B7VoMaw8rrmA3tkCWJSzzviUJvNEO
	 0Jlwaq4CalFM6AYP+gW8SVQ/fYe4GihsmeIS36oC4KNHFFU7MvdRsq1X0KVJY54yh6Gnf
	 SKwH9vipDqPW6Z7N6yB/7TTThxkIPoxaCi5k+mVNqftmxyxx+bS4X3D5X9zBqnb+dOVVv
	 5YtdlVDBgf03avAVVrKhfIn9oSB+sVxSZOSvIzXm8SxhaQQ3inO99hToU8lnJs91m+gQP
	 yMbitUsqRIoZDp58PcI1WsccUxnw7FwOZXjqeeLScjZdJUwkJmgNsqf2vZQZIAACg2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=tNjY8+hhVU4H7nudtWwRsBTQX4I5mOLQRqYzvL9iveg=;
	b=wOU8Lh5ilvYB9cfEKvO8Q7upVM7gfE2wmUnZ6e6mTAS2uM3tqHU9pl4YWn3WVN7BId/J
	 Yhp24gLm8a5uRzoyRiE3BF90schX+f+h+xq770P+4me3iYdGVYAjmtqmPyusloxMAcZGM
	 TCxTC3PBWgLoe/JgoPs1EA79erg3F/HAPtt3bjrzTAr0ic03JwbMqitXtuXNLDfMNd+WG
	 uu5NjOHmV3dvSHDZA08dJMOrGk38HQWowGIZ7hHw3ZOqxWx3SNB/113Ke51QB/SKCkx1Y
	 BCIkfsAdIKdNWn4ssuZUaLTFiMQbJFCQxztd+uLSkQimvlzqkpIotVPKepDnMJP28tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4Aw2V3r;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91488606A321
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 12:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91488606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4Aw2V3r
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so4060970a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 04:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436640; x=1796041440; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tNjY8+hhVU4H7nudtWwRsBTQX4I5mOLQRqYzvL9iveg=;
        b=g4Aw2V3rjZr1xtpTWENPFty3HEcd+GMMK5FXdGVAUh6wQosTAQp6BTeq6v6eP34kLj
         zHFCffnzNhNKywdME6otivVF/1DEBmoUeKZqQ55k+4IbY8dHEaOS9m0s8A2iaotIhi4T
         8/BRvZ9iCbs2nxqJT5gCW4kZig8dNIPTkKh+bekgcmn6Jr/UpmxNG3QWKD4kGc2CcyVf
         1GlguvIF59Ijvx3SQxamuK1CVigfsgeJBFdDoOBMoox/BFva08dpOl00KJWhZVyPxgbq
         jpUkB31frXWQlA6TqTO/gfVSWhKBqtX/XndeW73QCx5UlrDJlHH2CoXnqxoxAPp48CiR
         7TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436640; x=1796041440;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNjY8+hhVU4H7nudtWwRsBTQX4I5mOLQRqYzvL9iveg=;
        b=Lm/21BEvtz+xdtp+SviMUzfDvIVwM1HvpMbzCsrVxTrwihgOATAgA0eYUYQAoFGWUh
         JLqu+5g2rFvRvJJWhFjFO0lvo/ZLpByqe0eUmCJimGlQwpWsquz05eA3YL6qI3z0ulZq
         Ge993LBFuJanW76fvPZ9Pu3lnHMYD7lhFeeHfvaanTqFApJ+1iHqRVqDAssWsdb2EgDV
         4NKZPn2x8sDhGZzv5IFJxyGg9I/ML6tpsDTHgTodDUrOztTvl3ix30OjvNnrhjOk+kQU
         Kwl40V+PFTOnOpSLQ5IrUYKAjRmQCEf02cnuu9ElTeKQUFtno9Raq1qK8ahiLMBEjgxq
         5f7A==
X-Gm-Message-State: APuU4Z9bbryBXRi3OHmZo/OxpcHy1J2fwpgyHih5lqkY5uNgOItiZzvf
	XZSQwtgluUoZOJ5ZGKcWcuu7lo2Hfdo9UBla4bJqE7np5ljptAds8qV1Wp6pajz0+bTfR703A6U
	=
X-Gm-Gg: AZFdTZeSnhzdunjZtBcv3qlX5jJFda6TjpdmIEp5fAhLcOpV7vvrSVmfxa806L/fr64
	GbZglevODuJJLSiCvPXDo0sxl4VXLG2SyR3QVYmuUubCMA2+BnGvrT8A4msXB7UD8oENBOheIPJ
	NrZdPj2axSRWqt1oKCS9Y+jZAv/vhUYQlk1669qilBw4rYBgx/B47KFHXTYEo1MjWwJkjseEGO3
	wRQ1rOL1Fs/5623RqJAGl2sxTZLQW4f+GEQeoCTx0L4kMNLBrmPR9sjS6aaevXYRpPXyVIBuRxX
	52t1tSHfsuIuZelDFRR2QuhWkPRDdLJm90utF/PeR/+L5Qz63AUw9wjR4Vgu9AFHoj424sPjTev
	1V6Ik9JuCxmifsRSDmkpSnPVVZ7GVsjqSBA1ca9G29rnSEcuXggO9fPGx5HBSoKgCxGCVXHikVW
	jBsMFROVU5WIN6cOqc1ItO5HsV6ps9cbVW2VG6MzK3oRa24Z7bNJxQgLgNhVMuShD0aZZ3sV4qy
	L7xMOVG4kbOhgTzsnL7zKfH6RhwHgzpcw78B8M2WVEdta/h0iRgU60f2tjqi5A9ihGefDWew964
	c0OAYWCBAASlFYUAWcxqi1k7bgyQ9aLuh+mjNITTIdczXRcF3Q+Po1OP
X-Received: by 2002:a17:907:9612:b0:c2e:2baa:a642 with SMTP id a640c23a62f3a-c513a8845femr1010728466b.30.1795436639952;
        Mon, 23 Nov 2026 04:23:59 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42easm391318966b.60.2026.11.23.04.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:23:59 -0800 (PST)
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
Date: Mon, 23 Nov 2026 15:23:56 +0300
Message-Id: <DN2L64B7KMAK.11FXWAFFOOFV5@gmail.com>
Cc: <devicetree@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 6/7] arm64: dts: mediatek: Add MT6895 SoC
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-6-95c46597e63d@gmail.com>
 <sashiko-outbox-229131@kernel.org>
In-Reply-To: <sashiko-outbox-229131@kernel.org>

On Mon Nov 23, 2026 at 2:25 PM MSK, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: mediatek: mt6895: missing EL2 virtual timer
>   interrupt in timer node
> --
>
> commit 52307c1c986494baf205914bdd46826de40efb27
> Author: Alexander Letuchiy <asalde.le1@gmail.com>
>
> arm64: dts: mediatek: Add MT6895 SoC
>
> This commit adds initial devicetree support for the MediaTek MT6895 SoC,
> describing its Cortex-A55 and Cortex-A78 CPUs, caches, GICv3, PMUs, timer=
s,
> pin controller, UARTs, watchdog, and keypad.
>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6895.dtsi b/arch/arm64/boot/=
dts/mediatek/mt6895.dtsi
>> new file mode 100644
>> index 0000000000000..62584cec0f4fc
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
>
> [ ... ]
>
>> +	timer {
>> +		compatible =3D "arm,armv8-timer";
>> +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
>> +	};
>> +};
>
> [Severity: Low]
> Should this timer node also include the fifth PPI (<GIC_PPI 12
> IRQ_TYPE_LEVEL_HIGH 0>) for the EL2 virtual timer?
>
> Cortex-A55 and Cortex-A78 implement FEAT_VHE, so when Linux boots at EL2 =
in
> VHE mode without the fifth interrupt entry, arch_timer_select_ppi() logs =
a
> FW_BUG warning ("VHE-capable CPU without EL2 virtual timer interrupt") an=
d
> falls back to the EL2 physical timer.

Yes, you are right, thanks. The A55/A78 cores implement FEAT_VHE, so the
fifth PPI (EL2 virtual timer) should be there too. I will add it in the
next version, or send a follow-up patch if the initial support is merged
first.
