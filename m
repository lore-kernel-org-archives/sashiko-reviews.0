Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3273C0A06
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032746; cv=none; b=YLNGosODxsWSgHLqs4GSjAlQqeTsleeELJmiDGW3DwHzueL7C1x6s1JnNp2U2QuM/HWZStF2vxayCIBoepdr69oJO2jgt3ZsaI6ajdIOFoPNx0v7oqFzn+rn++27j0IGs0Clm9R/lZutce6hy61s60KMcWiULUZFjzO4Pe94oi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032746; c=relaxed/simple;
	bh=mNViGZ7yxzB8+8ItmsiT3QQGyqYZhT8Te5fHGZVLVhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tipy+g/nzwHh3onpDDeNMJtM1NWbAo72dyguNpfp5vJhHILeOmaQD/7aKvqVmO1WounQFTfseGH+7SdpzSz2oWpI6QhlL4dypLPxy2XLmHx0uEFHkVkN4iKDDtit9f8ZMfwwVVrLqGUv3e4Tre/k43ADcfG5NLjsysb6lnoXxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQDBj+7U; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQDBj+7U"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so9886575ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789032745; x=1789637545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xb297vAYZsYBQ8+FvK+mZugedKKuZrnvDZwoe982/E8=;
        b=qQDBj+7U3lFM7yUraT/U21EWgV+7Grm2S0V+ajnecPG40SA9TabhOcV+fwFk0qh+Ae
         VVZDcbCjZE0O0GNHqjgs8JH2+6UzpJFzaCqwyS42md/0n9f2VSJiRaPiRjMFihcFS1Mg
         1b5zMOcwiq45sWILMAUF8Czw8vcCkjNzXTYPdwRkx8XcMlBGU7WzWSzzuAN/L5d/rQxH
         89nk6ZvNWKJ4m5gDsBbjBsZlTsRX5/uN4dv69qjKvPJz+piCsZ91tyt6AmMpSgHAY7gs
         IKcMvjARip2Lm7fAH6RkLJlJZ8jmTa0/ge3sQBq5LbALtawPI8D0jEEpST4ch1J644DW
         3E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032745; x=1789637545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xb297vAYZsYBQ8+FvK+mZugedKKuZrnvDZwoe982/E8=;
        b=l+BzD8L9pjhHajqbN9wpO7MD5V4QyTJCONavEp8HuuXYxYP2GW6CqcdG9+VRKzC+fy
         9RwNccjm2WSAcNVXZcb4nnsB56dG+lA/FDo9IV/tiyvFwQGT0aczAfkzSERh+8+NNHYV
         PHhVI8mW2EG55ME0EU06diOypgsaS22oJBPCpY5N1uwUM6sEvNQ106Gf5ed/JrAR0sK9
         LwtIpyEAD/Iupcokk3dV2+EBcEbO/pg46OXfYcN9J2zAGqtLPmVYWDGeHYzqJvoZNPCK
         ThcVxnPBao/Snfwc7quL8CSpY4YHtBnjAEEzoIzsuN3irfGL1WiZvuQedMaaWacuoJzB
         KsoA==
X-Forwarded-Encrypted: i=1; AKwUvByIt99B0rbicFa0DvkM2WqcEJIhj+paXCClhf637rILMR2XsBY65i6Q+Mm0dTQFU/5DaCtkywfA0QgV5XM+Gb0=@lists.linux.dev
X-Gm-Message-State: AFuF++kltF47Z56Qqe6dw1rKoAH5h1qtk3IuMSWvcrO8M9iDlzOE4jv+
	+ZOFW8IZ0rdMFcftGuNwylZ4OLbb/2WnMNWMJkILrkpDt81CJn+UpU6C
X-Gm-Gg: AYBFou2AUdXSFfuitlmkPr9rgptRuwFCGffofg3Elo+NRS63yDG8tavHb4OWF8RcGJh
	MtoZ7pXs7l8zzrHJ3BM7w3eeu62zSYWQX1JDwK1uGgG5FvdP+Vq9j09fL0IdwROTWhpAfntGJNR
	SJLMBb4D04CrfhpZghISfpAGyCFHrD9h3v0WsC705Sqvef79K2xHlaTm9fWuVAr+SNzS/SvhHPZ
	KpKBKYXm/e469RZwS6MvGdNbkJ3yiFOuGk5obldx4xWxiDT7nKslYX/5Fl6qbSlVzG3EO+Zr7bR
	DScU6r8u9b/7IxwMqYQB7LXErC1tPmekJZML17QR9pKPMJdnUuquuNbMjej+T4yS5RoqUZXiJOT
	GGUPOObzHSIk5w2ikootdVLPFRDxkuIRHDIR7GUrSsS0urjKrdJiTH3Yw9MGGy3vB9Umc/M7aY1
	6TrHWTJ83lBIHSyCt3qfejZBorew9SJ5AINy/KtyXU3ONYNlPUhGC0kTVuN/3nQxUhijg+BHcMP
	l9QQBMZAnoSfUYe0sUA62QLHwjwjpK+HsCNh2uh
X-Received: by 2002:a17:902:f64f:b0:2d8:d4d3:da4e with SMTP id d9443c01a7336-2dd07dc3d74mr101752395ad.18.1789032744570;
        Thu, 10 Sep 2026 02:32:24 -0700 (PDT)
Received: from ANATASLUO-MC0.tencent.com ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1982c63fsm82958125ad.42.2026.09.10.02.32.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 02:32:24 -0700 (PDT)
From: Longjun Luo <luolongjuna@gmail.com>
To: sashiko-bot@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org
Cc: song@kernel.org,
	jikos@kernel.org,
	pmladek@suse.com,
	mbenes@suse.cz,
	joe.lawrence@redhat.com,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] objtool/klp: Fix missed changes to same-named symbol references
Date: Thu, 10 Sep 2026 17:32:17 +0800
Message-ID: <20260910093217.85336-1-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910090204.B58EF1F000FF@smtp.kernel.org>
References: <20260910090204.B58EF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Before this change, __checksum_update_object() received sym_offset but only
> used it for debugging output without hashing it.

At this patch's base commit (50d05c7c76c9), __checksum_update_object()
begins with:

        __checksum_update(sym, &offset, sizeof(offset));
        __checksum_update(sym, data, size);

__checksum_update_object_symbol() preserves the same offset handling,
including the unsigned long type and sizeof(offset). The difference is
how the referenced symbol's identity is encoded.

The same &offset/sizeof(offset) pattern is also used in
checksum_update_insn(). Any host-width dependence here therefore
predates this patch.

Thanks,
Longjun
