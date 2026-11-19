Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075313;
	b=EdpJXVhENZ1peapfhIryBgRBifPqtP6/PaZXhT2ahqpsAkiFChMwbb3THNyXGZ98oI9k
	 A4m4eQ/F+/D2O6wd85uF6biqvaUJFI+HNKKJR9O39C7T81CpNkJm2ZIlM8hrTeG/NaE/F
	 TpYFRztqSjP1DC0TDQVZWpqbamX05deBcr5LptKdITJ42pahEOgcOaJQze1uWVf/C0CDk
	 a+IOO5LqhA88TQQKwTq4cQvqgcFjrHL3Q4SN1YpskXKu1NpMPdJBhVOer+Sjfvj+Iv1ID
	 D2nnzcJa/zMy8MhJenmJDDniq/PRkDbwRoXS1vW7Knm8KuvX9ZN603k7Y6VTT96PJSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TD/zLF3BPhys0bLsFUd/QjGu/MrgT1KFKv1kQ2YB9rY=;
	b=i+sZUmH7DPjwZ9eezizyofFefSKfZBIx9bKR0zDTdNOTpJIS0sP1iLTvad6JpZ0w5wKw
	 8NNlKWPU0ElQ64eRqB1Vc/JUUN2UTBBlKkNxNWnx9q4OlHYLKfOcUIZ0ZM5gFxKSsE7aj
	 HDxBx3cqZv2cj14UDejNb/r3nctTFny8m3OHG9hEP8gUArYwTbEZKXX275dobmQDhHBNP
	 cCDiljVjdwsNoocaGfnYZevyjp5PrvznM4SLxqPDLHrrygnjn+vlw55CvGJE7yJ8CM/4T
	 Gch+m/SBH+QilawKMvh4voFY8aeWQ+cqPZrp8FblMMbNDyG7MVUVb4IMWje7J/MY5Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CSOT4J+b;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E2606A325
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 08:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9E2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CSOT4J+b
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so20236905e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 00:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075311; x=1795680111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TD/zLF3BPhys0bLsFUd/QjGu/MrgT1KFKv1kQ2YB9rY=;
        b=CSOT4J+bbSkPMjCoIGpYw2Nia4iI71uObjuQlMmoZdAYBlcjVjuj9tHVZJ56bPPvZy
         t9eI5T8mkfgo5hsTYGB/kSpSOoFM50490g/nu15kjgt/WpVjTLagRiQNbWjJV/nmzLz+
         xMy2TKpc4arkW8Us0XGjv4gVVMMm5pnceD+FvYPmUC7/Gk8q87LcFRsESO2ApRLiXFOx
         szNw5NjuiHuIQzdPluU4b51NXExk799CCXuwQyV9NXFRml7c0w3RfQQgPOjB1CItnZA6
         ZTXusWmz0NJ5v8IbQKjrmcvGIt1wqJLqItOn3A2vsYV9lPa29clSELmT5H2Cthso9t9I
         dKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075311; x=1795680111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TD/zLF3BPhys0bLsFUd/QjGu/MrgT1KFKv1kQ2YB9rY=;
        b=at1CF92cwTGgnFByxtG3fRdHzxTRdpWA5vf3HAFeJHQsW5PhvGWIV3U1o9RLvM7i4M
         CUKFyOxQGPRYd/m7U0/5d4nBwLSL5BNEPP//Dfuk7wkNECdOPnKF4ljNlC3Tvfry9rlH
         ES5TRodEiMLAibVgzsxBiW/0h83tQ5oDDswLtvnGqB7zuHZggkTPbFlaToE0Y8BbKBWm
         hfvTrH3PhYatV6WYbyZXJzKUBsaX4Er9doqgV8z6fsrgW9o0YiFtShF4IsRhqoaxu0LS
         6/N9F9UR5rmervLbwusw2gyAqA+LZpzXq34SgovXEbt1AKcC/SuXqbErJtmm3ikDu2t9
         CuKQ==
X-Gm-Message-State: APuU4Z9S4B6EE8zwldsT4okwK0PtJ+V22gqcHNoDaZETYPYoECow1Fku
	eQE/G7hHdiqf++o/0BNe5R8yiCndEGynmoh9P4REf9Xjb/jOXYpaxPHaE5gUfSc9
X-Gm-Gg: AYBFou31oM2OTxGKtMC5ITsT2E08uacSE8YDOKbBx/NhjSikmtz6+xR4VbJKIWhXW3I
	8gkt+M3XNXB34imsdMLhW0EfmRWFcaCwn87weRjz/qJbAtPWkTOWlTSHsaruT/CS9U0PYV8kv6G
	tdiF9oO7vWCIdaIgRmlgSpmZwy7+oAQwXKqQD9DDCdwIQ+ZOD7LtP7sQsYqcpkx17sNg6nu/73d
	ynxqWZs8MCYwNJi+erI8VMekmxwMT47cZ6lteVameDh7kdCOcwWLcZDTGntHJg6bGWb8E4sICSE
	4NzSsy3DDCTRQgakuiqZWIHTcyyDLRiyvL9sQ/W6wn6OjH/O0Wgs67BwDYWEDANLL8a9AyTGKph
	UlenY/E4DJyXFV4S86v2C5ywGRpE1Uh1b4mA1P2weQroZPVzUnjpqwDqs/alrlAec2cGMXkT+fK
	/gXxaVRbciq+3Lal1CSEruE9FJQCuIG8rGo4DGVPm/EwyXjtrmlbX/kgsqOSWATAFM0MWRwDIAy
	EdLFesGchepcT9peC13n/taSzENcfgCh2QCgqPODyRqBmuFKfEdjUCGPS2nvrYhxQc4mgVhEQmX
	qa0Qr9i9Wv+nifeiMy6RSe8khMRUjki0JhmGnLG6f4re8siuoTdT/44Bxmaqa45rIu345ud+M9G
	w6Ew6MioQcEShMIqIvD65ILwi6BRZ1wXrC5ptpjJ/UK/f4E4=
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb7da3a68bmr107159555e9.28.1795075310807;
        Thu, 19 Nov 2026 00:01:50 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560882asm9602389f8f.27.2026.11.19.00.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:01:50 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dwmw2@infradead.org,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] jffs2: reschedule between the data CRC checks of an inode
Date: Thu, 19 Nov 2026 08:01:49 +0000
Message-ID: <20261119080149.311902-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-222025@kernel.org>
References: <20261118214045.107562-1-orgads@gmail.com> <20261118214045.107562-2-orgads@gmail.com> <sashiko-outbox-222025@kernel.org>
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

> Should this include: Fixes: df8e96f39103 ("[JFFS2] Improve read_inode
> memory usage, v2.")

Yes. Before that commit, the loop in jffs2_do_read_inode_internal()
called cond_resched() before each node it added to the fragtree, data
check included; the loop that replaced it in
jffs2_build_inode_fragtree() has none.

Richard, can you add the tag when applying, or do you prefer a v2?

Fixes: df8e96f39103 ("[JFFS2] Improve read_inode memory usage, v2.")
