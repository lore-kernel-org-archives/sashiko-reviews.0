Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30462DB7BB
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 03:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357525; cv=none; b=TNktYjtQWDViWrsvI13kjNzYovgrmcxQSzDt5bpdzUXekoJz6qZ917s+MPhh99vciw9cO/qaIihXhfxg1dBRzrZKvzjAdbgiJ7RZW8HLpxP37s+C1XmFGoOsfyoZTVfIgCwMpEsvIGWV4KVhnbZIiuaALz4Z3PZtVhBXPaDuZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357525; c=relaxed/simple;
	bh=kLQB8+tIzL2zH1e9g3qNWfJ3MutMe/rWb/PEeNpXolU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fdluVWQYbgIjp3j2Lyuh10ACOVCo1qEJiOLHWhSVcUMobbpeH4MzMYt+8QiZFvg+fILze5mvEu5+PlxNr4gbe2Ms24m8nwuQHVHztKoXGnlTu9w8XMxmXeaOHpHPTO90YtLo7omDyaZ01hyCK3eC5qb+hOrZKXMpKbqBLz8Z110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoRiEF2V; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoRiEF2V"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c3304833so1134611a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 20:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789357524; x=1789962324; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kLQB8+tIzL2zH1e9g3qNWfJ3MutMe/rWb/PEeNpXolU=;
        b=JoRiEF2VzporqnfV3RuHVjQFcFgtdPdwiUQHg/IIehqrzFc6nvBl2dCiv6PN2WJ2u1
         uJf/L9GSVbaPOBAmbbj2zqIufX/KHnfMRMz/oxlo+fD81HfQ1VLvXAsbcK2r0IJ79Ik9
         F6oLm7HWxIfKPe7lmZaxDMpH1xAnvYux0Kftg9052xhNBHRACIERw2hTDp/Q5CrPVXvI
         fZx7veD8kvoUDQYd2zQKDdbnVjxw96E8Lgo54BWNNelqiJwTOq6DcagCfTofma782z6S
         2sfnBoxPLyfSwsxiv+Cj0Wf/HXioGiAbowKgDgtwahWIUv3FaiVAmlO5SFpHVxKSdjbG
         Qwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789357524; x=1789962324;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLQB8+tIzL2zH1e9g3qNWfJ3MutMe/rWb/PEeNpXolU=;
        b=TCN/hNxU551lcgIOUqspZMLmsVUbGayt6k1w1phBk2ONSj4uKZKazc3FJLcuj5SMjF
         Yy1qzmbmdDoV2uwu4ELaTGPdqWKnIfT6H6M7R1uXQqwFnX74p0WuOUtqvSWaUZIcFmDS
         IZNkTJw6Z/YMLWO1awrm2wWSRSYdaCAc333xAuZaPum/2v5fY7IVXZVfI9ZfdrkH1p2B
         ph90Y4ebV3m5cVWVSeqeSgrM6lMcGDFThSNyK+nZ/0m/oz4Os1OBBF5ikhlkcmR3X3Ot
         vJrpk9OGho0rgJje7nWU2TykCNj2qRL958eWwleuw1a/fTmikeTehi0mVQFXPyG1Ni1q
         qBzw==
X-Gm-Message-State: AFuF++nbOALUO3d/DQZc2mLzyDCkiAK0dhfABLhoXomsgWw7GE+gzSZI
	uzeUvCxxSiMnTRiW8xlQZ4V4Qlb7pYHj07oJlV+uBiQpvDKUkezbQYmlZYV1U1o=
X-Gm-Gg: AYBFou3MUu1s65Ba5UbOyVGviyPe/5lWr2ENyKN4nE0Dtr9teSqjDGswy+VHvCcfjYO
	nRLDF2Eh3c7pl1YIQTOGOLVSpCM6vBacWDy5UbyziLw37JJcMOcEHVhaqrsAHmY34oFw8mLn5hN
	xbjXA/khrCZT83bK+sWtFxXzDWMOVVlZKu7kCrbknoRvrKfDqhXEg7DJ9G4/WpJldambuY7soIa
	dE5F9QhXp20153cyQ2VvKW3dqGiMHmEBcvT1VCdHF9kU3sMVVcW3ulOve41U+KAi7bU6FGVVFOy
	FkybwUfPgkSsvXZRXsTxG6DSpJ00Hg+cKQMy/Kow1FXHuKpD5VTjVhS0Hu5OW8G3w1pRQfTqve0
	Wnr5bQkBF24WsVaxffjsBayprdYLoLXdCsPyNd5b4px1tAFb4Fw7929YZv8Idb/r/TBhOlILtMY
	hWIvkBJE0I3KH6k9GcaZPB7M3iaSinY7XI96YXOJ0RT4Scr9QvR+JZcuLYEmR1jSiQ5F/ZIyp5m
	evYaqTVy8FO7whN0h36XxXM3zRj
X-Received: by 2002:a05:6a20:d70f:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3db4039d992mr1502008637.4.1789357523650;
        Sun, 13 Sep 2026 20:45:23 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:3b80:bc61:4619:5346])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6596265sm4130339a12.27.2026.09.13.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:45:23 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Don't log an error for the speculative field variable lookup
Date: Mon, 14 Sep 2026 12:45:16 +0900
Message-ID: <20260914034516.946387-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913204554.91A9F1F000FF@smtp.kernel.org>
References: <20260913203156.941433-1-donggeunyoo.kernel@gmail.com> <20260913204554.91A9F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 20:45:54 +0000, Sashiko AI review wrote:
> This isn't a bug introduced by this patch, but while reviewing
> trace_events_hist.c, I noticed a potential memory leak of var_ref
> hist_field objects when a variable is referenced 3 or more times.

Already fixed in mainline, by 4bddcb346a6c ("tracing: Free histogram var
refs regardless of how often they are referenced"). It removed both halves
of this: the get_hist_field(ref_field) in create_var_ref(), and the
refcount test in __destroy_hist_field() that the quoted code relies on.
At 22098763a10d, __destroy_hist_field() has no refcount left at all.

That commit merged the same day as this review, so the baseline predates
it.
