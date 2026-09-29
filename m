Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706C54A7CD
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704228; cv=none; b=S/818tJXGaGpqAuF9sMseZdAZhbfMWrUANBPQGIfaLGhsyXKNPIzWWv0yqF1nagPxtOfT0m90HGdTIW9MKm4K/t/gZ4yHFwjR6dNEqD114Y1votFJhkwIA0tg+SjFH3l5yppx0f5ntWWp9FU7i9RhpPGqO8wcPO06ncJiBko9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704228; c=relaxed/simple;
	bh=JXImq5c8d89U/m2D0Uk/1rvyc4z0Deo/xtJ4+3h15+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCvsZfRKXO/tAYCM5ID+MCu5B7ha9UlN7KG66pgejDIKm1Plk53HVvrrOZCqnjmTRX+ARDQJ56ZBh/T1mhJpWTWk/CzmakLupB8cjgQbP/CEHu0f8vihE4vmpkmWXwo5Bsq4MEidWbA8d2bcmDX5o7TAfq6lTgQlFts+7QqBMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwfYC6Oc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwfYC6Oc"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so34993575ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790704227; x=1791309027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DurJlfglRtxfoYGfZICWlyKpb6JqelzUeYbLyKTge0E=;
        b=QwfYC6OcnnIFN8m2x9bRot9kDd0c7pP/qFvcfQ7gj6Hmf6pNyXIGnqnh+bUzd9uDP8
         4ZZUWR47VP4ZAJPCr21LlehS9mpB9E4Xssbx/RHNSkeVPIgt7t+4G0mhuUQGi4OzsiQb
         6A050TnHbj/xVb+1T5II7g5OjaG/G4U41xSUCuv1EZwymIpdcLvC/QpezKbBJRPkKQtD
         GCc9eRaQYMd937UMUH4z1yAGa8nlQEaSwy50vsLSLjZPVkc9/US7TqkMHEE8CCubTbJG
         js6Ts/dq3kUTMUjkzsVmPb0spsuZk3mjGoHz268kEoV3HH8ZhK/aAFqnYzkgrRNKw3Xp
         kibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704227; x=1791309027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DurJlfglRtxfoYGfZICWlyKpb6JqelzUeYbLyKTge0E=;
        b=X28O37fP3Y9LSeqgebrvixgVLg+b3GSAfURbADxiDKGYYYC5m7ys810U4VsJOIA2cY
         2xe02SUKiVx/7et8DCqkIsfureOWmZ+9/X4XocBO4r3FpyiTN0NhNTA47Ze4JbRrqXZF
         pFiLBZIBehFpz5gJQx+Dv68gSEmkqApkNfS4vhJdhwGK2s9Os8ERIMnY6ae/I7En9LkK
         ZVEChEpuUAfGprVeh38sKZYl6MBJVP0NSvi1COmD2a7vPLMb9IDJPjXK5FlglaozWz4C
         nkSkNyZJHuI4ryeL1bDeoeXETpj5oylxnDq0vRJhgSf5rXA/IXul9gTbDGGv359xo6RP
         4gAQ==
X-Gm-Message-State: AFq9FYJ3bI6hTK8EB0T+XFmEb1pTLG1QJNWE4xrk/XObfY7439GzkIWg
	7YcpY5OnxZTKEGTh1RD4h+QQ4CmCZNK8e4kQ0RZ1KqPQ9z2HNncQVdzWrpv0Lcvy
X-Gm-Gg: AYBFou19V8J+BBbU/KUfInLqwLOT42guW6O26AwDKWuh//iZBONvCPNkE2OBzGnM6St
	xmoLWPOm4OddpYpgFlA0wtqJ0HCqRleusnhs7ERHS6g61qnB5bcB0CbUiMq6Y5r/Y/RS/a7sMkz
	aGmjX3mqft9kSCK1WC72R+Cag3w5+xEYWOfmDDv3pWD7E3sO3GRTDn5vkezOAl+DCkRJQdNGpdP
	Vnm9HpCYvzFg0Wap4HO7fjnd0uVKMTApm3UQ3OmuaVYB+R3ozmvfqy0fiiO7a+BVrGEnZgTQzV8
	IxzpW4lyxBhMgr+mjOi5AvF5OrIjVfgpkwf6hX557DYkgg82Djp2cTARPBxHXFO03JlGsTRiFhd
	mlnw8/UqDbb0frELlpWb25LywZbUtcBdmKfZGOYQ1Rk4ALxUYjpXksNakHD35p7anjj9j/fpHOl
	6K+rJOc77oCLciXr46E7Wo/UTx4zegZF6bCQF/N+twegZ4JFGC5rLSGojA3T1O5/lW9m0piLNNe
	SczQjvG8IM2aA==
X-Received: by 2002:a17:902:c406:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2df7da5e366mr158748795ad.1.1790704226719;
        Tue, 29 Sep 2026 10:50:26 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c794166fsm15247035ad.21.2026.09.29.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:50:26 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	sashiko-bot@kernel.org,
	Joonhoe Kim <26rote@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Wed, 30 Sep 2026 02:50:19 +0900
Message-ID: <20260929175019.3899-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260929132029.911491F000FF@smtp.kernel.org>
References: <20260929130627.959-1-26rote@gmail.com> <20260929132029.911491F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 13:20:29 +0000, sashiko-bot@kernel.org wrote:
> Then, on the next plug, msm_dp_display_host_phy_init() will silently skip
> PHY initialization because dp->phy_initialized was never reset to false:
[...]
> Can this sequence leave the hardware PHY uninitialized on replug, causing
> link training to fail and the display to remain broken until reboot?

I tried it on the device (Lenovo TB323FU, a DP monitor over USB-C) by
delaying the unplug handler by 5 s and forcing a detect in that window.

- A normal unplug already leaves the PHY initialized across the
  controller's runtime suspend: msm_dp_hpd_unplug_handle() only calls
  msm_dp_display_host_phy_exit() when sink_count == 0, which it was not
  here, and msm_dp_pm_runtime_suspend() does not touch the PHY for DP.
  With this patch the controller suspended after the unplug, and a
  replug 20 s later trained the link with phy_init=1 and brought the
  picture back. The controller's runtime suspend does not power the PHY
  down, so the flag still describes the PHY correctly.

- Tearing the PHY down in detect() when the sink is gone (the natural
  fix for the scenario in the review) made it worse: the next detect()
  initialized the PHY again and hit

    phy phy-88e8000.phy.3: phy_power_on was called before phy_init

  and the SoC reset shortly after.

So I would keep this patch as it is. detect() clearing plugged so that
the unplug handler returns early is older than this change and is not
affected by it.

Thanks,
Joonhoe
