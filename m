Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865052;
	b=gD8TtWJBqL8RfYiaNPtxp6dYhb0x1QqRn1rV5ooRAbSUFnXIBavb39Xoge4h7BBFGFRA
	 ei5oBH67b1HkAYrmO4fsAg1iNLpBADID2hqfbA9jaA9I/eSNux8hIb3vom9DaNYEfsdzO
	 2m5VngdtkSeho7sg1oodDbM7hXLkcklY2bLHVY1HUWJEEBiCki5AZzcauRDOrno2QJEIh
	 ndrtDYC5h3TtKAh1Isa44gnhjMjtG4JpESYFSxIRIJqJw3np9MUdbxFdRhwrDq120Taj1
	 fRSQDLZTEQ3fZnt4R8bywK3Vfiqivl9hYlQkkY/5eCT1WikPUVGSGa4W+EHLDRrcF4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
	b=IGzmvQzseGSRKEv5HZKQaWdpURcKirezK26kc2fV5daYU/U+Bbd7GPjywJMEpn9+vezz
	 VLK/MxAzid9qF7NQM5CxwUJX1QmSb39eARQMuVYFxngJrFpjg/Qpe4F/90drZ+szzz33h
	 G/Efczdx9omJOybTKKAHFjjFdPrZvGGIbS6atEbRTfzzA75pYFABMdZ6hOODwAehs8m7z
	 pEoCAnJEdY1yiN+cW1aMAC8qcqr1vp3/vo3w94XYAmwOOOwZLWn0OMcOlo/gKOSp4zLHL
	 rFAW4oTaz7YHvFlj66HCJvFMBJebA/eX675uvX056rfzGS/eLcbfDHnfe1IzdYisdWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISpLMCmS;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF0C606A323
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 21:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF0C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISpLMCmS
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so14787135e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 13:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865051; x=1795469851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
        b=ISpLMCmSrbVC+HntuOLCTRBKajvzV9U2kqH/dp2s37pseFBZ2/JujqBFv98TL3UVrG
         wlSfQHctrYtYqERSh40E1i3vcIzx2T+/EJl7KE2Gi2vdG/Dee5d2JCV2sqcDJ1UikrKC
         CwBCRZ1ZGPEMunAn3EVbKSCcreeazfSaRAMMYDo//j20wtYYwx7uTK82agb41Yu2sOaU
         W1/moAwNsE9v/FUsTwKLVus+p4XHa4BFEvp7gUFY5zMQBbMcoQjTCGieFtm45duaoGi8
         VAeiiL7HOBEWyjTP2c0+B7lbMX3EPVJn64dE5dHbvShA6M7UhgCTsE209Oc8TDX6+anC
         Ffng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865051; x=1795469851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
        b=1L1X236hyjNrjzjhr3AP85HNm/G29E3PQI6Hi0tXxLD/nzOAKGk9O5xE+aUWH8Ifq9
         D7I1AGVtZZfJV2XPSVLgWhcR3GD1g1IgEbeLImSDPw95G5WoBY6gT+iLs5fa0Kf0ubS0
         fUQTBj9GhkqyrzZ/vGhR59rbL+ilE64WkCugpVlEBZ6ISZm5zhaxHc1q5FIy5CPKNv6Z
         DUJ60W/5FYVaEGhWOEaU/cmjLKL0zb9YXxjsT+yA6s+J8GxJlnjZofIoVxNmboazCOza
         xj0hDYAsw3HmjEGPL9wvkBcxi90NJLEDSfCxQDPlOLYMBkah4IrWHzgAlNDTPlSb8dS7
         f7Tw==
X-Gm-Message-State: APuU4Z9rkHmOKrTUfrvL80A52HUjFFHQjKRy0YI0dcMVsoDHS/LknmpX
	1kqVeDbtC8+xYnlKRJXZsuuzo48kWibGeiQOLPUuDupfOq4KN9HfeR0qZ8B7179i+vuyXg==
X-Gm-Gg: AYBFou0B0k7Ffw8v8kYpXeJMBTxahgM+JH3IXOJhFy9QQDENegtVkcFB0uRhhfM8sGk
	G+RaO6SUR4ukxvtr+vlEIrcp5OPfgE/QrRVwPgCpbB3kQezMqP+m8UYtzOuTIbREJghE/W1nVOO
	0EgfxEhOsLmnJ6ZAZmv5tJ9Kol9/MtQj//qy+foCnW8VEmd6DMYPvwt0Z99GLWDHpfOFNwYAM5O
	B+NzDxin66T+ty5cob56nWeq61kMKwJK4UW1sn0pJQdlgONqZEOipA7Oloh3B6EJSeKWcXGMeaG
	uU84/KeBoXw1zdWMiPCpwiG7hWrk4WqpEKN6Z853ZNlqrHJXyyanjkQZCpW3gzpufU/XdfwX7U8
	iSV3C9Xt4e6V05BMc4+7SEsx39Fjq45OoENkmRhcS28/yENrjUGJSYAmv5Ay/b29mhGIuv0Vh7K
	9sdUcRBQMyE+BT/6lYmNBbzVPUFt6BeVWn8v17gL4ViWkEb8laPjtdqgnPbCAyBjSYLN+0DLdCO
	S4OtqVVU7QhAphNmJFluakzcBao6oqhQ/5APksdoS97PInp4IUlWpeEXy6UAreMF2g2ydz8bGHs
	7/pCy4npzq3OurVB5wRFhHP70sFs
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr187933905e9.35.1794865050987;
        Mon, 16 Nov 2026 13:37:30 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb675200e4sm143331635e9.0.2026.11.16.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:37:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: dt-platdev: Add Halliday to blocklist
Date: Mon, 16 Nov 2026 21:37:03 +0000
Message-ID: <20261116213703.3774089-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-217729@kernel.org>
References: <sashiko-outbox-217729@kernel.org>
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

On 16/11/2026 21:32, sashiko-bot@kernel.org wrote:
> Should "qcom,halliday" be documented in
> Documentation/devicetree/bindings/arm/qcom.yaml before adding it to
> blocklist[]?

It is documented in the DT series:
https://lore.kernel.org/r/20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com

Stanislav
