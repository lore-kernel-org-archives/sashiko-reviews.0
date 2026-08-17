Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D14B0497
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967351; cv=none; b=FzOFbwde8Um8ym7AcBxr+ZHlFWSBRdYLcwhWvV/tfaflJ+hp313eqGb0Vp8gmYX6DDloApGuhb5jSgg0bm3IHCJzSYQ24dhNgicRIM4mDbFGOJQYypyNQ/SwrvfQtBQ8wzPaSG6TWqBrDbqhct1kWrkacT1JJY3dnvLU8fZQovI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967351; c=relaxed/simple;
	bh=+oHH2oNEdYmqVCEcFHAyqbUQOs4dxsuZY2YxaGGg4zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hiTP/7H9Xm2hX+X+W9L3DWtoIpTDXhjTF1lLVGDwVNs3Gp7aTDZYObOs7otl7dSGSbMSIc062upSIc7duXZ2Tt9ZrHcEhPESJ9F1fHGzp4H4nvSXTkEHsjjKEftlEJQBSKXTw+2BlorUsaJoH7QlvbTgi/kJKuTJSRVLmJqtqxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdisyJdF; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdisyJdF"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb7926836eso2200414a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786967349; x=1787572149; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+jru68zFVDUG+9X9/jsXrRXwodS8/wdB98bVrjC8LY=;
        b=sdisyJdF6rhbv09XLm8o4bWlNsB50GtwCU4ZZ/4lg1P+mT3gStdoLjqofLIqHR8zgp
         w7Gqfd4rtLY44Nv/uRZe6aMExlEg/XRYUfPdhADzGweePGsC0nzy95XZJvCrd2d1Hcx/
         L1RFX0S1P5n7lOwLOlcUAItBfa6qapKhR+w2H9kmvKrt71OK74l3gwkA6qDYwV4a21RU
         6w2ZtFmXcjXOM3tOLbaPTgU09IXU+jFUhaPdParTLFr8fMdON2Q80JQFuWmeXZlR6roM
         p3cFGsazphGq6jkxAf/M9Q41f3CsXcG6wd6+TaFQLeMN2yeiGkqJ64hGi+Cnl0Y0GbFM
         UsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786967349; x=1787572149;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+jru68zFVDUG+9X9/jsXrRXwodS8/wdB98bVrjC8LY=;
        b=D1ry758PDaG6RfDdj1sebUUkafDoZzcrvYqHWW16qsv3b4DUo+OdIZkDqQA059hMlD
         tU0qOlpMa0iGz9zz9g5b/J4795gXHnIB+Mt4yOansXwIgUmFFkmVf7WvVD86xeYoeTx0
         WQe3gkKFzFO3vEvoIeqfbCTTd7axvKXhwu+1gPDGGTzUw1iR8bS0Ejusw+5S6fiDrL4v
         5gO6lZX5M40oZzIyL8A4HOdKrEYRR9DNx0vhf98MAf35P6aLKGDGe2qQz1HDjuqoXoB/
         TFZWfRdtYFdM7BZHttdUvwefcsr2wI9iWBLCCEd+8mYcL7EZioZhLNaQNF4v9YfZXslT
         ORvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqV6DUUzIAv8+V6vcbw0R7jzItF8CsI0efSimDNnSHDPqfo8TAT38GwnszKRdzeF1/7OHZKbLsT4jZFBdcihaw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywukb1zEowNID0QRAGK8qgauWbScWlwCOIAZm8Tit2gnYEPiVxd
	PV92i01XHXwVEhvAm/8xanKzouZUwt7KJ2VoLpiPammCF5iQau/OIrZZTO1SuWRg
X-Gm-Gg: AR+sD10kS/0QLOfFJCBxmhEJKnRIr0Be1hjEWwFgN+eiEEVJrYmyazPxuHvX3RES8S/
	kpowqJgYdBdEyfwPyyY15Lmlh86vQpwerhDkI3HkWItYLkSFBr4rEdcIjcDUN1v3ctdSmz6e96j
	GBfmQwXUREby1ivfTR87PIizgpCTGRSiGHcxoeqMMxdwfHmjlJKeOlxXibBFi94xW+tC3Pto/Uz
	Ni6qT6mikLJu1UpJX2aOcwBGKYubP+ubljupqIt+5HrLO9/Gy9sWPJrUpEYruQHl9qLsrKnbxEo
	wJPC5Kx7QZnSACPAP27lrHnFgZhJj0Nt7aNTvNjwuLBOjPiy9Y7Ia9qUbBWRnkqrJ9nn8BopRX7
	Q7ZN9fxi+UsueKBogyY39J1AuwEUM5JKIrwBQ1ATdhhpxko15eU+IKL0uj+Oj14QjoCAnx6IZHV
	I3l7eJyoRWjGn8Wy5C5+iK0Qa6F48m7P070mtqnqTLG4/JOEPETB86gCmRHR2aAg7rvFURXH9tX
	COdTqmlb2N5Ele42XiENo4Ct8teyd7nnLXANFIWvsa1e1BmII8pRAN1pHhRTFWiAkAYaXp42Bgz
	TDOKYDEFHVd3qjGA4KtM6EXE8AnVDskzsyy0XDGNGGTfgXsUWDJj
X-Received: by 2002:a05:6a00:3926:b0:84c:2e2d:57b with SMTP id d2e1a72fcca58-84fde76bf46mr22504769b3a.27.1786967349111;
        Mon, 17 Aug 2026 04:49:09 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6ff0a13sm149453b3a.59.2026.08.17.04.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:49:08 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: linux-ext4@vger.kernel.org
Cc: tytso@mit.edu,
	jack@suse.cz,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] ext4: compensate ea_inode refs and free block on new xattr block write error
Date: Mon, 17 Aug 2026 19:49:05 +0800
Message-ID: <20260817114905.2708356-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817100724.923291F000E9@smtp.kernel.org>
References: <20260817100724.923291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sashiko's reviews on these threads have been genuinely useful — the
ea_inode refcount leak that this patch follows up on was its find.  This
one, though, is a false positive: mb_cache_entry_delete_or_get() and
mb_cache_entry_wait_unused() have been defined in fs/mbcache.c and
declared in include/linux/mbcache.h since commit 3dc96bba65f5 ("mbcache:
add functions to delete entry if unused", 2022), CONFIG_FS_MBCACHE is
selected by every EXT4 configuration, and fs/ext4/xattr.c already calls
mb_cache_entry_delete_or_get() at three sites before this patch — a tree
missing the symbols could not build ext4 at all.  The patch compiles,
and the fault-injection measurements in the commit message ran on a
built kernel.
