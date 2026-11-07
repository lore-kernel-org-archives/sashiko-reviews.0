Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045529;
	b=DO6n9lX0LspA1YEw+aQhGhoff5c+wl90s8cSjLyrdtqTN/AUaBCbq1jTYILKTKk7BVy+
	 1nae+Tf5L83/LUmaz4Ke2RZ8aqJyjS70lwfuVG1m/OT0QLE99gi55JpVSpvyqVPpYT91y
	 Q1i+e9ymXgh5cmb1lJO87dYHLdnTfOhG85UmuQH9mOVvNgakYEcfeTMwETTTlox6T7252
	 JWFt+b2vQ/eGcFSlwi7MTS7BXlZitqQI9JHHLp0XBUNzufla2/dR5Yy4862JgN+hz5dA1
	 zKyFpHLwhX7p0bK7XyiiemIKQiEzLHh5jNvsc8pT7yMFBuP7N+fbFXJj/un6XtWpw/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PgHfJfhPTBywx3NlxTS/kXQCqL/ALdKzJAvOY9N//Ns=;
	b=REcOia2nB4Hq5TmiLJkN2EXJCqon//SkxjxUWMA5DWVpLxAzRYA/YB/DLWT4lgPjGEDG
	 1YuE6wDYLy7LPFqMLXiwn68UqFEpGPTNAaTT6BajdbAZAHtyKhF5TiJ1qa0WO1mfTmLGI
	 OTN5LQEvy1Sm/QH6m8hR0YlolhvCR/UwIpWgedKodYxmkGCH1capcMx6N8VX/pSeBQmq8
	 LgiVB3z6RPZ7oVEy4A33NBkYK0agkbhvFrkkADr+DgZgRyJdCgR5iH9tBrEo7YxhUpQ5N
	 CBfrFgPMuHjarQzL4Z0aWHiI9oIX/1z3eoUvfBi5Dv0OKjpULeO3ZBK6+/prBF28MMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESoeMhQc;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C81606A330
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 09:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C81606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESoeMhQc
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so834889a91.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 01:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794045528; x=1794650328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgHfJfhPTBywx3NlxTS/kXQCqL/ALdKzJAvOY9N//Ns=;
        b=ESoeMhQcKwm+bq1k6SpFZdHZFRVhdbltPYicDVdB4B5KRUzsVHdCVMaUJdQ/T1aVk8
         Xc0xXQCuigFoHOQ1vJrqipPM+IkQkTZe54tfFwOE/bGnZPxuQ2X2abqeDorZQcGTZeME
         GuzFMAJpnOSalM/aZZZAVjeyGuWD1mCQXm/tI/RMruhs3vooVayoF1EZyVArMOpk+02u
         HBI+8XGIJn/SW9g2SRTiZFeCz0a20zINXZKJGA0PNsrq4VgmQ5tEOhFmmkLBGXxrpz+H
         QiPzyy0p60A/rDQwRJCUKTTW2yvGLNT+JWNnMc2eFdWA/w3CVG66HMQnoSMH7KpRNJ4l
         ht9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794045528; x=1794650328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgHfJfhPTBywx3NlxTS/kXQCqL/ALdKzJAvOY9N//Ns=;
        b=mOtTBjLe3wJrqV/v+laD5FGVPCNZr9YTc+2Og5xQPnuGXX1vOZ2MCAPssB4ZM3R+ji
         K/wVQ89tB20T0H+USjIuOlbuGQ1GQApxHGsODn0CU/5NE4h0s60x/fG75Pdmppe1K2dU
         E2zDHHRoQN/mk11jNvAPVuHjK5u07ool9v9y6E38zdtbNvGxflWkVoYkj2zvEwxEyy/R
         yUuYFqx2Smle+K9uy87pp5Opkdqi11IaVM+Ml4RkCl2/y/FmvBr7A3sBjgQRARgy2DFo
         ZBzuWmTY/+1HNuQYNoFqc6mmuyQFv8DD6m5RO5AvSqdsIV6FxvjCnr4Bu+ZasRiAbOJZ
         /xKw==
X-Gm-Message-State: APuU4Z86EQQ+Jtp1c6MSUDeaDrU/nH9gw89/zI07No/uLcn0QPBBZJga
	VXQgdcRFAzzgoASazGCu/5R8FNgp7VWq09DbANsbVgKou6Nao57buOuc/z8pSg==
X-Gm-Gg: AYBFou13BW9rtGq/wSduaTcdXPTDKKAcnMTlZ6yeLohkNExeVHKnjho7UFIEmKcRCde
	4hNzKKoWEAV8TKOC70TvlkATNhbGvAi5teKCSesRJ/aUrZO36XIEFq0jvQNVwAniY88elgW0bXt
	S38s1W/iCVjoRLTX+KgMNioj38zx7OcQSHZ3yTfyMYHXVob6RNkqgeLDIzHb+Vtdh00Fqr/lmWa
	AkVz04rFz0NqhJopRypC79Tzs9kQatANrbh2Cdx1V5EofDEEHB+8jMQr8y2831hSp+r5BlODQHv
	NDiMGaviK8+Dbwuwdn65QmH9jLiBuFkduZvfun5u9edWkchSgX6DnTVoWprAUIs4jTS9XV1uCwL
	xA5vGXijxSUDtOaFOKSH8Op9ZijjK0wmfQAQe7xmpbPYU7Gnzms2XWXlS8cRntQWnfzPBsjhlmC
	pAg4+mw4jzj8kpPsv/yvhsRdzIq3b+aUF2xj2ZPnhxl4sCXwOCmUcFjhEqWiImxWxjS0moROd+a
	6cQ3CCcj48sfcG3SPLgxorlW8oSTO+kIvYqPihwF6OQLftNsyITvXimShbUPDjFsopx2IVgwipo
	XT8GYuCh/6DP8tdkqqRl0Vm8O2g4I/d3E4Rj3JyhF+85WmDUub7I6Stq+ffCALbtdUEeQQBbHMi
	sUObi+0s6NxZlRw==
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr4913386a91.29.1794045528042;
        Sat, 07 Nov 2026 01:58:48 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105905bf3sm2888581a91.17.2026.11.07.01.58.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 01:58:46 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huawei.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org
Subject: Re: [RFC PATCH v3 10/18] mm/swap: add priority queue for swap device allocation
Date: Sat,  7 Nov 2026 17:57:58 +0800
Message-ID: <20261107095822.38098-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-188139@kernel.org>
References: <cover.1793106426.git.lianux.mm@gmail.com>	<b1580bf6460962c02d3c7ebf786583f200db491b.1793106426.git.lianux.mm@gmail.com>	<sashiko-outbox-188139@kernel.org>
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

On Wed, 28 Oct 2026 16:14:57 +0000 sashiko-bot@kernel.org wrote:

> Should swap_device_disable() call del_from_avail_list(si, true) before
> releasing swapon_rwsem?

Yes. The next revision will clear SWP_WRITEOK, mark the device off-list
and mask its queue entry before releasing the topology writer. This
prevents a newly admitted allocation reader from selecting the disabled
entry. Cluster-lock draining and try_to_unuse() remain outside the writer.

The preceding available-list patches will also keep their state transition
atomic under swap_avail_lock, since they do not yet have this allocation
reader protocol.

Closing this window also prevents a disabled candidate from being treated
as an enabled but fragmented device and setting cursor.ring_only. For an
enabled device with real fragmentation, trying the same-priority peers and
then asking the caller to split remains the intended large-folio policy.

I checked this ordering and the large-folio control flow in the
intermediate commits. The final revised tree also passes the targeted
KUnit scan cases; the disabled fragment scan does not complete on v3.
Those tests call the production scan helper directly, so they do not
exercise the concurrent syscall selection window or the queue's
large-folio retry/split policy.

Thanks for the report.

Lian
