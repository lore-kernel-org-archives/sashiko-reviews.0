Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F75481226
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158708; cv=none; b=cRWGAbi/cT3FzVEf+9+iU/uGzQwD8M6F/QhlWgXcszwijA4vo/ZJMLzbAzb+o/f1pJYLKot/reiMtSYvQhzH/5z2700CevhGCrK7OgID7M0dv/84agwqhErIqXlOKzCPNAyJZOq7dwz4rw1TJ/PYoY7t0EpgHVNgakyjJyIUSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158708; c=relaxed/simple;
	bh=a+cJdm8IiZcacYLUjAZcRb2XVSYMoCvpEgOVZcRpriI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3XgfET3jtUxhurnmYee7us+7QAReKkDuigc+kmLzy1b2bry/FrJ4/aLNZ2og4zj5At4pxYuTIbJL3LHRVn2G6BT7t2ncVFi7SrFRQtH+gDnIw6UFfgL+sLF4v1GHSZgSJXbKMpKcIJXMfr5OIpJ1T3hMN9q6c1/Y5moEfpbD6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjppMa0h; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjppMa0h"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso459636a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790158701; x=1790763501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4Qt8UnZ0vVuVe6iwFyjd3A5kkZMGcM702CaDlGMCck=;
        b=JjppMa0h1Gf6Jkp17haGkcwmMzGY+ghj64P8pS7W97X+RtLID46vet9c2ErQ1cHfoT
         xPeLqdV1HwAZHHOvgGoR2Z+HDa5HaRlhEy7SELEHwc5BOCC7+NgbK3hZyripcDNqMwug
         HbkbUIK5QPyY1R/Qn5bx1xAwsS/ZOZ9WCyDappvX9OvO56XPAbJw5i8r3/PefTcRZbQI
         kWT/VFfw/YXBS4GYxqrsUpDMU6ObYPVEiw/uvFXJ4jv4Nvea7DXXKD61pp2AFmUH7BXU
         EqUmFQoCdawFrGqFlCRVtNtNnPNN08jyWue+xUlYrAEwYP1mMQpU05G0jEf/wn0GLx9V
         zZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158701; x=1790763501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4Qt8UnZ0vVuVe6iwFyjd3A5kkZMGcM702CaDlGMCck=;
        b=Oq54DCtgHe70Qp+rDXDHGGVBZc0KEEKB4llTiOmlJ+VE5YPNLvxoI/yfYZDj9zktf8
         qAWsC3G+yUDlHWXEdnFzcPBxQtD1s5Vj1ANaeKR5VQBpk353QZQWE1R1650LhHOXccrP
         WCX6kFgg8eJgZ9oHQxtHpxrhYuusgowbJlaqN7SVKqJOgRMO0vvgvKav9eYD+zQJCQwx
         YrOTGzH0AyS+W9bKrRlpDnzCGCbSZhdhtJmdxSi7ELczY6cy7fYBeorQxu9hHaN8jbbn
         HDHK0MmC64s/uXfIHUSI/MwAYQlZxvn2rgzWCFKihjwWBHFChLhSmIHdDTSWI2veK8Bc
         uFzQ==
X-Forwarded-Encrypted: i=1; AKwUvByTOsQI+acHpSqYqHamIxr9F38jkhl2oCJLdKiRhqfXGw5DruSMxLZ3rpvW1RzXvy/OqJaOw4Yv/Wv9BsqLX7E=@lists.linux.dev
X-Gm-Message-State: AFuF++mMyHYUCi2fc2a8ecDxRRqwGDWyOP3OXlePx40gE5db/3QSj/uO
	cN9E+thm1sLFImC/iHJWFUNLfG8dV624ncSJ3u4pxj9FhtkIowvmtoMNEPFzM2jU61k=
X-Gm-Gg: AYBFou3B8OoCJ8xTzroJCNXlA1OgA3wEoVlMAsWvupLgIge+tpycn68LcBmY0rgWdX6
	gF+bY/55C4JWx2aXG2xJwJJmjvTpB+mgcYwjWEHtYW3oxPA9aq8tWpTTiUSt5Ex8+Z0C03DSxRY
	3JZrg5gn7mNEfhg9OxAHmMxNY7spXSBhwhziOEXJjP5VYmofvFJtpusTyL1sybk0LzdTsoJiH5o
	VXlPOa8rchZwII1XpPnqSQaD45BUL6WFFgam13yJgmqZKB0hSFWsx+wlN094tzFmlRz197dGDPp
	4VbbpsU6N7RQD59/srNnj6HnUVHQTU9rVCbGhQ2R8R5seG+K0gOI//BeTTjM0ozk/LNC4qT+fks
	JmvQq/FUU6eNM7N0v29eTwwH08i/7qAs2nn8sXPj78Jp7XmR9gTXH4MZqfP1K1Zjsa3SxrkQsJz
	XEmyQUaurek+30SnBdYiA+74Tr+AAxCu5pmPMFkYO28g416OGgkrwjQsxtq7ansAX7rMpeUZfuu
	a4T0lpb5R0mgrI6V4ySifAaBuhQrXCYyRaD7RCK6ZQ55QDHUtASfff0qav7IbBA/bVtlEGLPeBv
	+3pjw2ZcrICRY4NM0IuOrml9TBna6nJSUdFtdurIa2qn/fSlo0RBv9vLYIWtfg==
X-Received: by 2002:a17:90b:2b43:b0:39e:4717:7cd9 with SMTP id 98e67ed59e1d1-3a07e313fcdmr1820334a91.0.1790158701335;
        Wed, 23 Sep 2026 03:18:21 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbf69f0sm4423738a91.8.2026.09.23.03.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:18:20 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Jan Kara <jack@suse.cz>
Cc: linux-ext4@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3] ext4: drop extra ea_inode ref in cached-block reuse path
Date: Wed, 23 Sep 2026 18:18:17 +0800
Message-ID: <20260923101817.3507594-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916072420.316321F000FF@smtp.kernel.org>
References: <20260916071046.2182813-1-matthias.goergens@gmail.com> <20260916072420.316321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ted, Jan: both findings come from the tree the review ran against, not
from the patch.  The baseline was ext4/HEAD, which is 96485e446260 from
October 2020: HEAD in tytso/ext4.git points at master, which stopped
there, while this patch is against dev (9091c97be340).

- [Critical] double decrement: at 96485e446260 the cleanup label dropped
  the lookup reference whenever ea_inode was set, error or not.  Since
  0a46ef234756 ("ext4: do not create EA inode under buffer lock") it
  does so only when error is set, and a successful cache hit reaches
  cleanup with error == 0, so the new ext4_xattr_inode_dec_ref() is the
  only drop of the lookup reference on that path.  If that call fails,
  ea_inode is cleared before the goto.

- [Low] ext4_put_ea_inode() undefined: it was added by 4f48af3dc755
  ("ext4: introduce ext4_put_ea_inode() for safe deferred iput") and is
  declared in fs/ext4/xattr.h.

Sashiko takes the tree from the ext4 T: entry in MAINTAINERS, which
names no branch, so it uses the repository's HEAD.  I've sent a patch
naming dev there, which is also what linux-next merges; pointing HEAD at
dev would also help other tools that follow the default branch.  I'll
report the stale baseline to the Sashiko maintainers as well.

Matthias
