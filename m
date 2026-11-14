Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794624712;
	b=XodbeURfLWvVmKxiqEuWQHG5GBUMRoXCwAdGPX9cuIdplvJee11Ao4fabp2LiXa9xYLy
	 tA8Kg2arsVsxbYYSuVNAhwh4Yzahsu9kJuSghKSm8wVp8gkBPNbUx41nofU4R4GMEhCQi
	 TcNqLR8ogi1fCKihlFGtpRRhhpIkqtcBZJUerNUay8QFIICPOAIJMaLbAqaCzPo6j80lz
	 vvBO2Cj6Wdrp98y39UxLw5EXnz9aRHMQIdlKRn9uWw25ELhetJLQehueNqosTPjsyUHKr
	 DQ6W/VAMLrTkFepC21NZoUIX+ll+ORccpbPHNliFXfGeEvBCAtiCUAZb/JMi3jcAxww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794624712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MhJIErRaTVfRxe+/WdgTiC6buoyYG4cHph19YbmHDSc=;
	b=dbUpWXdrN4LznLkDGMXHP70UhjjtbkBTW89ZMUfWGDNy71kjLOp4XQQlI8o72pv+nBDI
	 lcl3Uu5/7qx1fmW+OTiwtYHGiAvx/ysOEryli63aiy2m8nRLgHxaoSjXEJjitUS2ppJxe
	 wB1UZC1wG5MbhczE1z8CG5JfnTU2DlxaYckAJfHMkBvKGtgLnFaPLaGHZOcjQCQqckO8I
	 8G1faoWmkJn1Y1W4egfY6UPVd1aowqkfP6zotCkF39ZrBcZx90k++bWKS3CFrw9kJJgxE
	 7W79aRUK2gYa3AAiUeAOnvc55DudM/6FS8gSIioQmhGOmQvX7h4JtH59jUsbAHUM+jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUpgcazj;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B668606A323
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 02:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B668606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUpgcazj
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so102469966b.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 18:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794624710; x=1795229510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhJIErRaTVfRxe+/WdgTiC6buoyYG4cHph19YbmHDSc=;
        b=fUpgcazj08zVSkLAt7nSaOPOrWSL+LoswtZIpl7QOHnGh2xvJcOhCjAUyotZ/dzyrU
         k0GpAVxWZoDmfegLnZLNpDfDy0Siy2+5gbE8Ti9Xp28qDUIHaa6o67QIkP1gLfuHiyFw
         o/cqKr6Bh3nxKlmJZTReFnUMys1VOv3lQvHWvyFWzqBxykgbZAtBn2CYCtcrVkhpuY0c
         ph3DDIerutWN9lwACko1JpXa2t7uEsobfMhHoBOf3tq4bOHbJ5Az+knV6O4iT154YYSl
         IelED1APT9a9L2ZBqgqPF3AuC5ovTXBc4bdLAPqKRHsEqAa+zrRul3F7P1iWe+1Y8YHE
         OGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794624710; x=1795229510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhJIErRaTVfRxe+/WdgTiC6buoyYG4cHph19YbmHDSc=;
        b=w2Nyr8/0lp9wxaQdSNRFenIn5xY0dXeMBiNDq9Mr+EDD+jlzflbswR1jZLRzxf3RvD
         kAOaN5A3qbw/TRo64ZTV0OuWNdo2yhzJrEGDhzG7lyc5rPjCVMMGKXKkELF5FvqLoJcs
         Hr0mWayiTSMCDJEHRYcX4uq9baw5dWbWnww7/nZaofjJuZExlRar8QAcitXMsKuujh+H
         Zxoi+R9Wb8jpBNE2PFtHBbXK3ikxhbleVHErNsJqVgyqGLTX4s8aMcUqJLTFTIV3Qa7L
         6UZor1HqA+JeZA3EavuJQVp5XnoHrDv+UCTar9mtlKWE2fMIDjjQvxxlcmdm2ONpAp/T
         doFA==
X-Gm-Message-State: APuU4Z/1+jFVtB4Xi1aqHR1Vys9PGFZxhjrX05Jl5KG2zhvrRy9IWkYE
	RjgcgqYHw9xxyWRP3iwlONuH6VDCHUoj2fxMgPCX9LSpDM0mj4q5ckxeyS+nmGKzqBc=
X-Gm-Gg: AYBFou076uM2w2LmMHA/yg7H4Ew3OIdkSga+9vZrhs7D/b9QpqMP+o6mQgYKq521Q57
	p7qR4uyzqTlxlaXtX0bBlJmT4qCYeLJ9W0wTK6m2wAa4X7h6LLougVjgYPKsChxGIUlCsRHyEn2
	hv0BN7Htv3QuM3M5JWoUsG9QvvLG+taEpEcwe9l1DC/LOn5xcX3R6iLhJIq5X2ODRcBfWPKMlH+
	vuUkqJUnHJ7MLTx1BggZEojrYXZWfgBjBdIhdwS6jn+5sfYux0AGg/8jvT+HoQkk7j/YRCV7yDI
	knImicXvLbBdQmClD6CuyK9Q1+znXbd01XALF+eP1r3sG0TbHcj0ZJF1rDDCpTWhqssO0YQeBfk
	++zZmLV43Py+oeF6+HZmkRdUkmnjn4Pd/IzMrd4iCgcH7nrA8+YCZJRRfOC/+hS4KcZMSwAjnsP
	1w4b9RnX8C+P6qPYKZXMvux203pdUhMc5GJpDUMTq6MKV7mpW8M2I7C08yxXtX/VaeVTtu7/KfJ
	dckoHQfvAWqpN2Eg2KB85e7Plcf/92FvsCqyXN+srTbsCb1cevFI9YfdArX/7czL17GgFg3p+HC
	0iN8boQmXFtYqHWhHhOQg17bSs0yvNkfSChGIY4uddOrNeO+BrtNz8mRC9ImLcvSCl5TaU9BNjO
	6Pg5ZlXWNsqeSAIuOL3yDT96sCWS9iVfgkAvKke1cfXzM
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr367846866b.16.1794624709830;
        Fri, 13 Nov 2026 18:51:49 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b58981sm166556766b.45.2026.11.13.18.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:51:49 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: ElXreno <elxreno@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	ville.syrjala@linux.intel.com,
	ankit.k.nautiyal@intel.com
Subject: Re: [PATCH 7/7] drm/i915/vrr: Allow VRR with the pipe joiner
Date: Sat, 14 Nov 2026 05:51:12 +0300
Message-ID: <20261114025115.2419087-1-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-214052@kernel.org>
References: <20261114014335.2132756-1-elxreno@gmail.com> <20261114014335.2132756-8-elxreno@gmail.com> <sashiko-outbox-214052@kernel.org>
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

On Sat, Nov 14, 2026 at 02:24:32AM +0000, sashiko-bot@kernel.org wrote:
> Can allowing vrr.enable on joined pipes trigger a NULL pointer dereference
> in intel_crtc_needs_joined_update() [...]

Yes. I can't reproduce it, no third pipe can be lit on the i915 side of
my machine. v2 will have

+		/* A DDB change can pull in one joined pipe on its own */
+		if (!new_pipe_crtc_state)
+			return false;

> When a joined pipe's DDB allocation changes while VRR is enabled, does
> falling back to per-pipe updates in skl_commit_modeset_enables() break VRR
> push sequencing?

It delays, it does not break: without a push the secondary latches at
the vmax vblank, one frame of up to 1/min refresh later. The cover
letter lists DDB changes among the commits that keep the per pipe
sequence.
