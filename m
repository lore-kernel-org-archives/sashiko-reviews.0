Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586793;
	b=2Cw17Y0WNQtMQgqfOUDjq8l/VAGFyVq8DLKiON33VPo9JopTxTX+UOrxI+xDn7WH4Uz1
	 a08BFIndxhkvVr47IrJ+9g8TRZa0n+LEd4AQ0BoW0ipqYHoaVI6K6m8sn7h1lFeXhlTDG
	 09y/o0sX9NouJLCcQsLHZiK4fd3SfWKJHngRbhLUNHEv14KAJuIL+AsodpTedGjtI8hrd
	 F0D8FMBS0omJoqq3qzK9TOjQGeS4gi2Oro4tTTbYF/4xr/kJ4Q2TL3ajLmqsiTcjucTF2
	 gW87PQdKPQH2zNhACW5Ps3EjSj68StU3dmAjPRovcy7tH53N/NF4ZwQ27jFu6KZBmuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zXEijJWzEN8qMzo3aWKU8aRlCg4X/j/vwnA7GLOW2G0=;
	b=lOoO3dEWyg+9A3QepyHnhH65sc+UXX3wAmvDMByesgpbOMhye4Si+DnpNlJ5a5VKDjvu
	 OwJWD0Nv5uW8+ULH1tPH5VMROvbHP7wA7u6Hpjz9eyZxa6oXRlKpI7r5tY2C1IvGaLsbx
	 DlpweN77i30Rag1YBh6e1kGVF/XIsLpFlob1dJ9AuCRCGntveER9gF/p+pvnIGJSZoiS7
	 DtgRHXZHS6De8TBSunAVXXcqd7WWsGx4l8w9LE85Nd12zgcXVonZvVWZzFM/W02tp+dRN
	 owvwiGOrIiHuduje/0wGFtDU2pjPSqIMKVaRMCK4reWOeXIxldt7xQaiv9eZnKkdgUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="RcW5X/H8";
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C7606A332
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 12:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 250C7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RcW5X/H8
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc013095d4so203751137.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586792; x=1793191592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXEijJWzEN8qMzo3aWKU8aRlCg4X/j/vwnA7GLOW2G0=;
        b=RcW5X/H8zMBd3ikrz+AXAVZkUgEpM4BkRohT2Z4WSX+6SBM+1X7Wi5IZFdTCwtc3yO
         wG/+VPACUoG1EyBXQwVE1adHoW/YJvhspR/D5klhPLOaDk5xxkfqyaMB4aNOh959NMHz
         5gI8F0PYq+BG23I10C6rqmNwN7oBMjkcyBpXkRw/+Qy813jAKYd1gLnomZnmKc4ARJfd
         LlI5tFlJCSs591pzG/s64v0ITZ7bDoc/1dyFB84mJtmd2DLtxPw9uiJUFh1hKKuv9KaZ
         12Fuz5IcZ1kosv4X3A40eIQDfSHh3bD//r1eRK8v710fz/F+xWNFGyGYYzXqLihQaPkZ
         rGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586792; x=1793191592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zXEijJWzEN8qMzo3aWKU8aRlCg4X/j/vwnA7GLOW2G0=;
        b=fV1BJI/JgjIyp7jlho9EzuFjgPpxpqA9GUC3SUTgWwF6EhRFIZEeB5bDHOjlklhoA4
         +dH41FKDz+uBGUPbkuUKm5J3oaOQ8rCZs/JPuvhjBBy5v3CatnLgmNUhYc4dnMx3nH4c
         VsOHvp7JyH9tFxqTb9F9Ml5M2NtJo0yvLB63KjoogIIqfsksCH15JTDN8Z+rUcy8NsJC
         x7pJtmc9SRNHWluoXNygnYylAbspczzRzT28THuWqc+u31dJS2zgrAQwcULaBtlXWXAX
         wbH29Mat2ClTtvUH8oDr5ahZGha6KKqU/Oga76En9BYxTcwD7g4v/xu8pAZsZg1B6YUp
         M1cw==
X-Gm-Message-State: AFq9FYKhvumsfDrB2hbAlhMP9Iu9qWV1e1mxsVEIlSlYVj/t7Je4fuYf
	rdjL2Bs0BVJR9pb0AQcSG7qTaBipxHgANbRyfT1+pfj/FA54LeDvPq04kWVw0XQZ
X-Gm-Gg: AYBFou2LWgAWmznBx1S34pctEk8/4j2PbZIJ0ZwZdBUQMz1zDGYvMCKZEo2wtU83ICz
	TppvtceulQSw1wxeNODABDxWMqsWEf8G7zeLG46788emJSEwIqzvjF9fG33poomWLqEpv/Jdlj4
	QkujF4+CAxpNRD/PFGI+HY9nFgqjkWAJvWjJFaZXj7cfrlirMlAfuC0G8VnyQIsLi1WNJPQS0Wi
	WW+agrCB+3hfpGw6J2qU8vfu+HISw27CFewIN8H4vqwOwOoUdlKvIorrq6UCozflb/yysMQSdy5
	/O5f63gkyH1DMiLQ8V3QnplRJ0Ni9Iiv/Gwss0Z1h+jcNQGhKZ1iTQdzg0zf6+j217a4D8DD1j6
	mQeYB77DTOCWVu57U3rvue7mcNoRiMD4QWuNKye+YttAT0wi2d028r6rEilEWbCRY+CrFVX3v3w
	wUIeA+vCqcJBkZXUOC/fiw1lcWT9PnNiaqOGKOLloQAkkkUnI/320wS5/mMAe0J4a5DZZp/r9dN
	/WHcNTKOF9f07ypK8v6hFumS/gPtd7jby9wZyBlcgRjjEdvqYq+EkMS1XXUHap5KFnEttw=
X-Received: by 2002:a05:6102:d87:b0:7a7:1db6:c769 with SMTP id ada2fe7eead31-7cc926828e9mr541224137.22.1792586792118;
        Wed, 21 Oct 2026 05:46:32 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.119])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc923f5762sm2585277137.9.2026.10.21.05.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:46:31 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/2] drm/radeon/vce1: enable the VCE trap interrupt
Date: Wed, 21 Oct 2026 09:46:09 -0300
Message-ID: <20261021124614.107065-1-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-180189@kernel.org>
References: <sashiko-outbox-180189@kernel.org>
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

> Does writing VCE_SYS_INT_EN unconditionally in vce_v1_0_start() access the
> wrong MMIO register offset on CIK (VCE 2.0) hardware?

Thanks, that is right.  vce_v1_0_start() is also reached on CIK through
vce_v1_0_init() (cik.c) and kv_dpm, where VCE_SYS_INT_EN lives at a
different offset (cikd.h) and is already enabled by vce_v2_0_resume().
v1 would have written the VCE1 offset on VCE2 hardware.

I have a v2 ready that only does the write for family < CHIP_BONAIRE.
I will wait a bit for further comments before sending it.
