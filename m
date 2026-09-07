Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7CD314B72
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 04:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754809; cv=none; b=IFDnIJlljX4gAzCsg6wSYupeVVTxNCFnu9hQOU5mlgSG//7G3KqXU1eHLkVdBIFqIfGu91/TVxfk1mgchzjN5NIj0GQvz737dJJltZygkH7lVVho519U8d+xzmk2Dby6eim0nRiuhhsX4hY/jPVuUfjr/U5o5UWB5aCZUOsgvlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754809; c=relaxed/simple;
	bh=13CPypz09GHt9o+0sfOOv9IrECBM665aLcfLRm/+uBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFYJWCAeVbSbJcrf6lYrYMahbgmgxCdjtD1027Y1iiToQz+PFM7ywZEJyPcFCmhYh9nwH747UIxK7iI3X+uIEcSaT3MrBVfmDz2apVwmpuwkMn4TGja85U5ShmJj3RZSMNgHVTl2hTSMNkztnOLnIqZjWeqkw5MNAlCUID1McMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hU/CuY03; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hU/CuY03"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3371379a91.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 06 Sep 2026 21:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788754807; x=1789359607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsYcmqAIPiZsMsBOMftJZ1oehq4IFi5iQpNBsUOGPX8=;
        b=hU/CuY03cKPH1olG76qEzJHvVQc5f0cW+E6PGqrtCofGMrrx9DDu2Y1XBP3Csc7b7a
         htWjlXEM0f8GGKjHkwqfUXhVQ8XGNspM9mV9NpeE5eaMDy3atVpaktz1ibuSeLs2ob5T
         nFMNd3X2h5gs06PLO00ze3d344l/vjBhJGB8Wjl6tyni6VMEdMjPpLjcYC9vOnuTiVAH
         RKeAeujqT/hMqHgkm6H8GT5uD3SkX0WC+UPWuBlBwLncP3hjp0PQ1qy3aR8dxxxcscQQ
         pEBrCp2NNFFBooMtwlDb1gwU77Xuwt8ZynOp2fG8Y+PWs9jT66GSX07TeqKsWhoiI8XR
         3zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788754807; x=1789359607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZsYcmqAIPiZsMsBOMftJZ1oehq4IFi5iQpNBsUOGPX8=;
        b=lbck3qm3y/KMXLyfv4f+himNNYLU4yzbCd29us3NBwNlk4Aa7chdN4ucFA5xupVjVc
         lITZzuhAoehH3tOp6/1vk2zk39+ix0PIiwiSH35BecAWfOlLiIAJgbsIHUYVou88Bk/o
         Z8kZE5quEFS6U1aLbjGTBy9yKpqFT2oOZaa0X/V+gf2HTv6NxB+Fq1WwBbqSFKZi8zyW
         iXXIf/oVCWPh6xW9QeCUMyRSqVWXv2deBcPo4/VBdbfuFxiOKTFicTWh2sL3EhmZzoQP
         5pQasYVCEBBykB/OA2Dx50V8Beqqth2GjQBG3ewN0O3jqndcno2HSvHYNpSkwE9T5QaT
         X+Sw==
X-Gm-Message-State: AFuF++mE4Jy3LDqFd89S707VanTgKpJVvNd/jha+NjlEkyx+TBSnV43W
	F/NjtONrGJMmfKmSVpjuEjOlZFba3kY5jK4n5Kanlq2uNL7D3PAJ2+AHekNyv5FMmA==
X-Gm-Gg: AYBFou3GWHoZcuyKuG8v+/fhS5zKnanoOLods7dtu+cMdq2/hdoTeL6HeJU2urrArk2
	na6U+p34fvfiPQdLrFZR5FfzWEndMuxZIZ4aE+4nYoqH2Fwh8l9GB1b/U26Veq0BtKPDfBSYLAT
	/fFcY6HqZ0zmm8/9rs2xtr7t+dTeeYUkD4A4Chcezfvi8TWUQqZTJ1znmIpcNPLZEh7S6RnUi4a
	BWVOcG7rvTzS3zTuyrYx3xFwPsdlN5KCgydZ5aWcy4rbkA+4/qIy+EGOxeE3p1YU5V1YobrhPvB
	IHdZWiD4gecCTmBWi3CC6Q40lSKdT0GvUAp5SE9FNidbG8PVkVxm44ffvbBRLr9I76kn7QLFahl
	IrLm+UVJ3sjT5qAvoesXPaPWLeTtoSrKCch0T5I5l8e9i1ReXDcAQPAPDWCK9Vg2978nMYJHMG8
	nd8UVsbdaHpYUSIO6Sze2x5CQNvuHYlozmOwW4Ja2n/i3T0svsMhnigmPGGpVXQLfdn+0O6Wlsc
	+F5fPdMhZn8oM+V
X-Received: by 2002:a17:90a:e7c2:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-39b261da126mr30116286a91.19.1788754806962;
        Sun, 06 Sep 2026 21:20:06 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm24076502a91.4.2026.09.06.21.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:20:06 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] tracing: hist: free the field rejected for a bad modifier
Date: Mon,  7 Sep 2026 13:20:01 +0900
Message-ID: <20260907042001.263449-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907040425.92BE51F00A3A@smtp.kernel.org>
References: <20260907034948.240387-1-donggeunyoo.kernel@gmail.com> <20260907040425.92BE51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 04:04:25AM +0000, sashiko-bot@kernel.org wrote:
> - [High] Preexisting memory leak of VAR_REF hist_field objects when a
> variable is referenced 3 or more times.
> - [High] Preexisting memory leak of VAR_REF hist_field in create_var_ref
> error path.

Both are real, and both already have fixes on the list:

  tracing: hist: free var refs regardless of how often they are referenced
  https://lore.kernel.org/linux-trace-kernel/20260906124025.3550596-1-donggeunyoo.kernel@gmail.com/

  tracing: hist: free the var ref when its initialization fails
  https://lore.kernel.org/linux-trace-kernel/20260906133352.3815019-1-donggeunyoo.kernel@gmail.com/

The first removes the counter rather than changing the comparison. Its only
decrement site has been a no-op since 656fe2ba85e8 ("tracing: Use hist
trigger's var_ref array to destroy var_refs"), and var_refs[] is the sole
owner of a var ref, so two references leak as well as three.

The second switches that error path to __destroy_hist_field(), which is the
one that does not skip HIST_FIELD_FL_VAR_REF.

Neither overlaps with the patch under review. The field freed here is never
a var ref: reaching the err label requires one of the modifier flags, and
parse_atom() returns var refs before parse_field() can set any.
