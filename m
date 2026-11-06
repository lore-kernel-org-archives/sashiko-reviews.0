Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973290;
	b=AHbST1ncRTku40bvRCAD1KyDTPhJRk4LH99q8x60QOwk6BG76rG0EsSOmN9v4TFKZXKn
	 cOGsVlSAtSxHWdfVHlca9zXQNUA1N3+qqLZHG1naANrADy/ETM5xdBlGLnXGxXHZG0XUQ
	 0gAE59txiP4qDAtUuJpaSddpgkT+yhZRYZLoGt/rKFZgmbn/L/5JpwMpNH05I2BreMAaD
	 5R5XO0OKBsFtMHSF6VhhBiJUj5qf6ZW4q2AuBz6B+iVOQO5KMttmXmo4TsvQqgLOoC586
	 mumFQ1dV8wunEAhvVr2mkttMfMTTnGonpRl2a1wD6qIEVZNWr6QO20RuCcpgmc5HMHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
	b=NTwDix4okcHwcabK/rjgMM7D5mel7asSGX/zzeK8xDujsn8xMMx5QdO2l8aHSx//9qHp
	 2D02vkTbtwCXDufzqVhN31KeWQz4dB+XlcJLHSyYKj7dXcFN3vKtqUerXeMfF84S57iuR
	 nL9+7rxwktj/p8Pv1Ekhsv7QsHMeR3e1LNk0AoDO2e+gaHi8teSOmUCzBLuUjAcNMJYZM
	 he1wEbiWpkKT2edI6qR9t+1f8RbsASV3WZ4UvzjKmqU8sp6nyp/0+WRco6zJH6/a3p757
	 2XaB5muyl6SW4GHSI2I6HH5U72Hj4cINL3DuNwOwDA7m0J0916EZmCoUx/XOtSmcq5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKQe5X4o;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEB5606A32C
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 13:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEB5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKQe5X4o
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e4831c028so673859f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 06 Nov 2026 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973288; x=1794578088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
        b=jKQe5X4ovmlLPMNVFoi1gxo0wkEbNtW+aAsc/tqXMdgg6w6M5CAInB9SizzgvPw+1c
         fWjGt9+otm/BNBThzJSBTaq72+4ccXKcbBJcwoPzFdG+cqVMOqMUrItnGQeodpadDpoP
         /6pcUYk6Kn5VvfByuK4D9rv3F/8FC1W4oE3PqWEw2kQ1BMWRLdwBF/vu77POrQ64/EPe
         QUXmVNOLkSzrkCj+dbwOtuk8iGviy0tqKOBVtWwqVkysLj+FhIOZOeadIinjJck14XwW
         jV0ymiQE5c191Fd39IIrJtL1i247ELRXq2CHfOaZokupMFzg8Tq5nESE/oFg8uI9Lu74
         a6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973288; x=1794578088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
        b=njbs7y1EoNpo/qN42D69pJXl7jk+ou8Eq1TRr6kyPGAyuFKJbDhV/PnGs0EZIqFtYK
         qisrGCrOUilDvVNtvlWSvpecKz8PBTTIdTxiBL/GTJ1KCKkhBymnXO16P+/LzAH6nzEp
         8PE32RXzGKi1ySEN6BLZx0uQcno8yHsG9HlabEXXLkoqIS/+IhIAu5cRGgADV8fttVP2
         LM/nMfOsI4BHdP282U6wX+tOaB+1GPE8xAL4TYN/F2p7xV+Gn20mYigxqc4pPwJcKkuq
         2M4S1v2CaFSkzMQJthdUS+8s6I7TeLAVkuTbQdEow76WZ7eYZTqlwEw7Y+TzO2239tib
         hiaQ==
X-Forwarded-Encrypted: i=1; AL+hErFCdztGklzzN6iCMmOvyZHr6iXfyykP8R5Tr0rrlFMxfk4gOtKgkuGMAzrPvL+6QkgJ+8ksGuRm7XTlnUXsrVA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9CQ+rkHnttDJtf6Cv3+IDPIJCn2E0R9c0ntBRaCa8ge0WS9sg0
	xlckbzIa2DRcXhdQDmmsfvlFG+j7P1KeZvSOA+VdC/qBTjQ/ltJ/EUSX
X-Gm-Gg: AYBFou04RrPoA8bAAostZ89a68HlBuRXxhhI3XzLpvsMq8Y4/uTTrr1zndvVzzJls29
	+6peVVfdsaguZJfHuFPimYdSBjei16pBmZr1rGa8XXl1rWIE1C3mVpfg/wV99KuHuyBpXnbK8i/
	j03UkIOBRVHSxLgqR5GAN/QYyd/SP2tdreIOSHrfH86CejIsGvZKEctHgJ2yo1EMOEcWMoDXZ8I
	2zvCCAsdzm9060pwMrUxWEP72wXcOpt/MMghUePqa5rD6RhzzvwBqPdHRg5gdse+HPUp7IH+rFb
	SJMqjG8SnP4S3LoOEX7yvst3Lr5FAitUl5MXW9biri+IhkA0t3kWyp7F79jGVxZpj4iA9iOaPUh
	VCLTdATwk2iqsdYLYwI++S3mOuJK4EilEho+ye2m8WwenexavtdTQtSTgQ0xk2QvxNqUliFR7lP
	uJCXRPAc2ih02gLxrKBv1KOs2tYlNbhWylkR+3CS6yiV3DPIIaP6UZqZ/MmbNPKn1LoJ6G5jBM6
	twWCbx4o/kOIxV9QRjfhB4n+hFnsNh4+Irojiuwut1Vil5NUPY+qC11gnilbQWxiVNUCgOaLuNo
	kNQxrcGIyV4y2RxxjmOtUlOiP9PZmxraIvkndt/YJuZS7dnEMUXtqByiOVUPFOhT6sct+NdC9RH
	aoJA3oYs3AUoXYO19BJ88Ql9Pr70=
X-Received: by 2002:a5d:6f0a:0:b0:48d:dfff:fe6b with SMTP id ffacd0b85a97d-492760da71cmr5896957f8f.34.1793973288307;
        Fri, 06 Nov 2026 05:54:48 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:6118:66fe:a6e9:e648])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm3393124f8f.0.2026.11.06.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:54:47 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: add PocketGo
Date: Fri,  6 Nov 2026 14:54:46 +0100
Message-ID: <20261106135446.1334980-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-gentle-shrimp-of-weather-dde4f4@quoll>
References: <20261103110524.2812831-2-romain.tisserand@gmail.com> <20261106-gentle-shrimp-of-weather-dde4f4@quoll>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 01:58:02PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 12:05:21PM +0100, Romain TISSERAND wrote:
> > PocketGo is the brand of handheld game consoles such as the PocketGo S30
>
> Vendor prefixes are for companies and I cannot find anything about
> PocketGo, except it is a brand. What's the website?

You are right, PocketGo is not a company, it is a product line. The
S30 is made by Bittboy, which is Miyoo, see e.g.:

https://www.retroshelf.org/devices/bittboy-miyoo-wolsen-pocket-go-s30

I will drop this patch in v2 and use the existing "miyoo" prefix
instead ("miyoo,pocketgo-s30").

Thanks,
Romain
