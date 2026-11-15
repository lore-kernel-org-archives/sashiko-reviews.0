Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794729594;
	b=cft+4bqCLo0Zd474DLFLaBoZnxiH90Lp4sB0OrnroOCb5Iut4sD7LDdcqvQR4L8BP+QI
	 RwJl0OKzXEtK4cjTcs0VEyIKqQxh9wVUyK+8hPXIci2PfgkUwGgS71hI0Wz9bHUwWKRMj
	 6u7tCVm5yXoDs/vR1fSZw+xrXUIFgoM5ClvreQcKhE0wRFahgCkgAv7iBvpA0D6aXU3TG
	 tC1OzgDM2ZXiFXaeiqL8iy2bkY48Kdpri1OmWy5WdcAqSst03h3qhcPXYGeHTeFqBfeYo
	 Q9kiJ2lLk4sYie6oqrvQGOCn5VJhiQXYut/ydAfOXPnGO3a94DlzH4luMMh+pcyiQUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=uTDHqE1Lg6G8+bxeAtYf/i35aEgyOGsm68xtWenUwWc=;
	b=5XXMf5jsME7gGGoVASOe152xTXQCBzbtAGI4m9errgkc+OkSpOil74C/TYRBs+0gc7uz
	 MYlcHdnRU1J/ZZKbOua+fsMHcqO8GcTk4LDrOuRZqA8K13kYyf2xoAFWBXQr9IH8V7DDX
	 bm0ADtQdexLJ/lHiNe7pXrSq8P+hq0s4StZ4PV8LtWtVkl+W/t4wLnNPKNr0CznfYB3gz
	 gvs6VY/TOimmV9Wr0aPYHFH5VPlCFfqEJBUSjsu9/66el4OYEXMC7UaZkFHONBG8Ku3t7
	 zxP9sIuYVRd+fGODWbh1KecNd018Tfz0PaMWJIVQhiNVnNYydqqdXAY34wRa6QGuzlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzaBQvUw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB3606A31F
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 07:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7AB3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzaBQvUw
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so2861701fa.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 23:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794729592; cv=none;
        d=google.com; s=arc-20260327;
        b=V4hJ7Mn7XzJOkWAAyBsMEdDeCxahOTluH+L9O43Lw44j2tiDAlv7p94eweDYolKFdM
         UQAAvqlWE/LJrmWrw/YpdKMBDxGRUyk0afU5TzxkhG1kRXRqIl5GCQ9jr+v/U8PNY51d
         ZvGQOPOtsRB+RFO5OioLZUiUwqfO7avqGRQWZEN64CiiA0Riw5SUSUElrn4bbEFlkfHr
         jSKPgq0enE3g5/momMwvI1GGRaoOs6NqO/jxRlVFenRd0x9hj9fvTYj5+Pa+BBqAynpi
         MazMAOLCFtkhmgSHEOxY7HV3nV8VyWkosohEwlSJFmkKDIAoAhvqSa5J/5QoTU0INmDj
         pDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uTDHqE1Lg6G8+bxeAtYf/i35aEgyOGsm68xtWenUwWc=;
        fh=COUlEg+NHZ6LSdAIW75AjOlcmWlxiZSIFJbB67Yp8A4=;
        b=nUahUomcWfzi208msBpxoFM1fXqJNJ7D34MTBfhfLcE2AMsW7WvXl5Wrr76j6YDGrf
         m1bVn5YxxhYd1YbGhH4y0GST34N5fPjF+qUSkdgMmmMnJSKURIj+qGLqKz7Rpo0oMQem
         WDyoYRaGBePPl8G5i0IGwAhHxizoz7QidyeMpJHoZZszXLT+beBTCjNepzTqXlJs8MdA
         rHpvGGfW4d5WXz7725+6ecUedz5Xhasb8/0c65sc45nL1VLL4BaaqEXPBtqOR+FQtc9v
         a7YwVZ9RbUyh9z5ZIRmWN7IQ1MoakkVPpMi+F/cWl5rqZ9tDnd8zjU/iJYAsUk8gdiG1
         PNWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729592; x=1795334392; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTDHqE1Lg6G8+bxeAtYf/i35aEgyOGsm68xtWenUwWc=;
        b=DzaBQvUwn0tb4FKNr4NnXIj82LwnaQ3HhidqHYmbRsbeLcw58iq2ewr24tYf2kIZFM
         qVxqIJSCVhDFlGGwgsgPvsHmLplmYk1VbiQA5etg57YQ0irsNmtiOEihxxPdN3rDj7ZX
         on/U78j69BFoACnORe8J7qarvGfrkY7ylD4R3mSQeqtFpZd5TvrzdtgO30/6g7rBbKWB
         Rlubf2d/RigvHZVdCVg9kzMPDbe8XtAJfVkLXzqYJ96DK+CJBipqLO1uosC++IG6mIFR
         HJJwBNLBCKaS1gFoVeNFf/flt+viqTumz6sXUE9PIUuELfPt/MoPQWtVzyqlVsM9g0uf
         Ymcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729592; x=1795334392;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uTDHqE1Lg6G8+bxeAtYf/i35aEgyOGsm68xtWenUwWc=;
        b=jdm9LOKCSdta82k2X/hngyJf0hhaTA3iK+MLXwIfnKd3N6pmwNh7q03oD2v1jwEPfr
         5/a2DICIEZNWTigVxPnzdEHCM0ccLE28YyMt/PfGDP78nnu9ncGc4v2TD8Dq9+x4q6M8
         N93vYxDimm7jIoPsPwispJCzAv/d1o8vX9w/8UPg8SKIEWbOglPCxXfAem/tBu9FxuXH
         UUQ1OvMzhqk121iu5s4s/y+RvH2G2BLVwyQQ2UyQfjQsN5MyMi097ja14nV8vNdexjHD
         oRzxPng/EDXGaW00zsCVr12w7w4lZtZa2/f+ZMLzC0tBbsG1FCQtl58VXVmz6ptsMoYQ
         b0dg==
X-Gm-Message-State: APuU4Z+kvYTQodXngHWyjsXIfSFV2GnHRpdYSWgcNejLtl3OrhYmtg8u
	GSeygPekvHPZ9JePnySaliVEUg2d8NcuqBLZxeCeiI6djFeSLyVcb/URJJ/lTmtnficBesWR67Q
	H20vdqKPOVDEjBwYPDv0kovWaF48yfRzkgplzhPs=
X-Gm-Gg: AYBFou2xYLWEgrpZRVX/duZFI45n9eQUey0jVcJ9dS/lwQLWsUGFb1FfWAVe0d0/Gcc
	mbUMJ9r3gTSXSKYqvGIY8BIdvqyFRDcur+SgW4kEyompx/O8gNDQJ+Ck+B14706SORu38C052VG
	gxxCqo5WsnGcsea7zlkLWadrw1qdl8qkgyQcg5WrvZCzx8UsNqXJdAW7IA4x9hIr91bIYkkRGCk
	T9q9G1Sgb20J0SJ4Pw68KwZZJ0wfBDGzjDPCFeNNm9zZTTqWxBjX7fE4Z9UFt6wuVPs1vr0IIr7
	cu98bPfAhIPUa+G5/U7JXnYUw3fIC20yQhBV5h5iKvCh4yY8wiZCUVM5VHlsjfeem3UKUv27yA9
	P/APxVsQG/4Cqm62yCKH1Su5NsspZzzIKB4396eOFKP71GUFD/crAtlaI+0CJ/sLehBPDP7o=
X-Received: by 2002:a05:6512:6c5:b0:5bf:ce24:38c8 with SMTP id
 2adb3069b0e04-5c1709fc01bmr2810875e87.4.1794729591806; Sat, 14 Nov 2026
 23:59:51 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-9-231196049a3b@gmail.com> <sashiko-outbox-214777@kernel.org>
In-Reply-To: <sashiko-outbox-214777@kernel.org>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sat, 14 Nov 2026 23:59:40 -0800
X-Gm-Features: AclHuK-JybsEZ6nSpOrtN4adzzDq3bM7zDeeZmmerdCe2Ul1Cz2qTLFRAuITT4w
Message-ID: <CAEy9hNVh_DL57=pa4_cEMCVC4j_mLhWCVsfRdqZ1=Pu_QHJakw@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: rockchip: Enable the RK3588 PHP SMMU
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-ide@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, dlemoal@kernel.org, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Does enabling mmu600_php break deep system suspend and resume while
> arm_smmu_driver lacks .driver.pm sleep callbacks?

Yes. That is why the cover letter asks to hold this patch until [1],
which adds the sleep ops, is merged. With [1], deep suspend passed 3/3.
v2 will repeat the dependency.

[1] https://lore.kernel.org/r/20260929034510.2023173-1-praan@google.com
