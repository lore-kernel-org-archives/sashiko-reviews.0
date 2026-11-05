Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913687;
	b=WOpJVmZsWZ8KPJ5UP+uw06yvyAOEpQB/AFafHyJtM+09nepMLukkeDDjvLh4a/ChNIFi
	 GxJ3q8AcBctfHEK8IP89G430RnkAxDQIa3KIkGQQkKyKfhdmzKOMqI1xlOBqb+zu2NBsE
	 K6l3BKv2Vs8rDwit6TRblF67xkB4+samtV3KPg4MjPSGuAkkouEH2goigwylk6go7TDBJ
	 sUGQCn8DpNzls0eFGIAQrHkK474cbgJabFE+YLGUoqFrHxhfleW2JPbrqFI8loemWjGND
	 lM19GonILKb2tCeC1bGl+xsZG5L2knZ8DnZDY6m7+NE9JArjuqq7EpGo+8iry4SZoxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913687;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=mYhI2qcOKmJVw5RCTn0YfKflDeIKtBajzcEsykn+w90=;
	b=2QFwnjQzydTjKNEXAcrJHHWHICxmLsRE/M7q0L6otsmPi5TEt90k2Sw4joQuP2k4H92p
	 M64f+DUJvdfcOAofJ8cXHqGcueCwIdMOyAen+07DWof0g933qNBnJ65F7yz44rb3vtnQa
	 1D6un5Utw20lS4lJspxEQEand8szWa7mjC46I9yvlThVIiL8f6O60kM5/71TTSqlFiPII
	 55bUOfvoQYxEoGC87sg3f5TFUaybXpGjEMw2bgOThPaB2S4igBXGsV/Ela4GlL8ZsdRyg
	 bzk2rSz/oMGHtIrQss6OH+qS2J0pmscEAlov74iy3mN3ALewuZLGjca6FUz/GHONpiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F3606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 21:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1403234a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 13:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913686; x=1794518486;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mYhI2qcOKmJVw5RCTn0YfKflDeIKtBajzcEsykn+w90=;
        b=Y9eIgqNfCJ9crXk9/63Mgkd95JhZa3ZzpbJtuC2pyzyR8eKJO6UD9c5LrtA3EtUJZd
         N/enRvHzfEzwKkIJ65kxPXwscjZMeWq/biw43b5YFg/TdwYX+IiNRewokRGrBvF5qpCd
         wL3e3JL7S4SjfBJ9bApPjGF/8ZUg636uVR5QkBP+qNaOxtCqXs6XtRei4WeOMUH8xQIn
         IQSf9IBjl1kUFmOC437MSmgRQDAzggXukOC64YoNpBxb5EbtQrCzMiC+didSZtOzWmxT
         yhx9o1yh77z41QP3eY/djm9B7D3q1pOGdf5hqkxrfslO+hOTQmZQGVUEgbXKRV1a28wo
         E9RQ==
X-Gm-Message-State: APuU4Z8URbf2fPy/CyR8acNw2y6BcU6xKb5WZLqSFmfTvqp82Fdp1es3
	hVJ4Hb0Jgcnbc5QS5hhAToBbYg15xEKk9z8YYGuzqqc4UUokgS/cWFhAGiG5tg==
X-Gm-Gg: AYBFou2qf+o6Hak234kN5/JU9EGkQikZGqSkpo1iPl/GAp2g/KqRtfWczZ1UsoSSP4U
	XVG0F4Cgq1XMuy0wNGCVGprLY0UTmhTbmF0qyvEa1LwR//xxAHkqj7u4xLhS3FS2/PZll7IgCLC
	EnpVjgWZAmU5daKMuRboTnpnBne/F/ue4Ob4Re3Vh7Z0/zWZXWNEYh0YQnb+Msdex32qaA953fd
	GcnMGNdc7tBHpL6ZHa3sP79ktLl8w1/YQLyY5QNhgOVHVMDGhrxLChKbvTLY6kJODIhHW0td29P
	8guD1jIXHplF913Wf9UsxJHTPkaycuW8lFa9Ma8TIsO0KA6QqX583DXnRR40kExg1HGb3lgCk4Y
	IPK8Cd9sk0a1RfqA9HVJ9Wn4R7dd8Fz+35BGc32H1De1yGv4rQ3TfmB3OMFYnNXp37luOt5O/Qb
	SFULGQ3HvbmdhS5Ha+PnOouZPsssHx9Vj5Oa19og/6zeKxWA2/V5uvSjR7l87T9AzVIR67hYh/7
	CUPjhhaqgvtJle1TA9ZKSevjROO+snGTe+38+eszTezDh7HA64FcxbX/ifCTFhkuxDwayDKOIyB
	Pyc5fNK2hiO0xzn84isaaw9KXDTpE23e1h4Zk2iDk2Baax16hpESk1XaoksXdr3lj9tLvHwmNlW
	N/8NQQ/2P4RiljVRC+LTNsxLOuwGdx5NCNXyfe3tR5PVX/WFBrLSbak69hHh9NRdiihI=
X-Received: by 2002:a17:90b:2b4d:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b0db6e89b9mr274242a91.36.1793913685945;
        Thu, 05 Nov 2026 13:21:25 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm5748964a91.13.2026.11.05.13.21.24
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:21:24 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36d6765756fso3080092eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 13:21:24 -0800 (PST)
X-Received: by 2002:a05:7301:fc0c:b0:369:9af5:7bc9 with SMTP id
 5a478bee46e88-36f75f25cecmr496793eec.23.1793913684120; Thu, 05 Nov 2026
 13:21:24 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-mxl-gsw1xx-reset-v1-0-53839bf5c88e@telaak.dev>
 <20261104-mxl-gsw1xx-reset-v1-1-53839bf5c88e@telaak.dev> <sashiko-outbox-198649@kernel.org>
In-Reply-To: <sashiko-outbox-198649@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:21:13 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Yd4Kh06mE-vFMdZYTX4k+2oRxSgya77PDr-WB_Ha2Mg@mail.gmail.com>
X-Gm-Features: AclHuK-Q-qGfrbnTxlEBViO6tL6sp-oj8M4F9597oktfM7WAx2-aqOXdw9ZfnJE
Message-ID: <CAPY4CJ6Yd4Kh06mE-vFMdZYTX4k+2oRxSgya77PDr-WB_Ha2Mg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: lantiq,gswip: add reset-gpios
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Instead of adding more variant-specific exclusions to this conditional, would
> it make sense to split the standalone GSW1xx and SoC-integrated GSWIP bindings
> into separate schema files?

This follows how the schema already limits reg, reg-names, mdio and
gphy-fw per variant. Splitting the schema would be a separate cleanup,
so I'll leave it out of this series.
