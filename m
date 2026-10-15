Received: from o1.ptr9745.em.honeycomb.io (o1.ptr9745.em.honeycomb.io [149.72.141.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531374DA9DB
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.72.141.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068998; cv=none; b=l6jtxxnL8kCHDxpGOvjpC5Y3K7IPAX1sJLVfh5kWqy8Pjt55xC0iOS73byG1YMNirwxDl4e+FyrRa1UH0rZFdFBzwSGtsCJqZlM8AO+vjMiJjcXWyPD7V5MPrGLLe4jTDKPw63Vc4CttZhQqbPJEfPAwqLNEyYT4NlDkU94uoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068998; c=relaxed/simple;
	bh=qc2AJOCH4QDxKYIGT/mWQmQWts5cRT+i3j+JBQ50Qtk=;
	h=From:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 To:Cc:Content-Type; b=oP7Rf/DsiMo3TyqCVKFMwvfhCIkkACDPRHpsVctTvbMjX6dpKJuKVA6Y0Fa5D0L7EgtgBuE+JZ+rF5mu75xw4CtERYPyxCkjv90XPlm4Pg7tNQXidiUctmV0EbL1ZyVPcQKTeG+xhuCMkVriyKfkeCovJybitomUls8GjNr3KXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=honeycomb.io; spf=pass smtp.mailfrom=em.honeycomb.io; dkim=pass (2048-bit key) header.d=honeycomb.io header.i=@honeycomb.io header.b=wxLTJGX0; arc=none smtp.client-ip=149.72.141.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=honeycomb.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em.honeycomb.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=honeycomb.io header.i=@honeycomb.io header.b="wxLTJGX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=honeycomb.io;
	h=from:subject:date:in-reply-to:references:mime-version:to:cc:
	content-type:content-transfer-encoding:cc:content-type:date:from:subject:to;
	s=s1; t=1792068995;
	bh=qc2AJOCH4QDxKYIGT/mWQmQWts5cRT+i3j+JBQ50Qtk=;
	b=wxLTJGX06fDaAAaV1uXRnmD5/7XANFg53tNMFicqcglWRocqZRt+ANgNWTaX4wH0EPWt
	+teR/WsYFSV3NGAIG8s8Kn2m0TTsqr6yOdKO+CZmdQls2vo7tfMyEmBTuP+8FyEa+S919S
	61ZLibUunraVYumiJq68VLWc8zUaqRVfIypPNZGJu5LCM2dDjigHcRbqXtVrxHfA6CP5mA
	NujJP096yBEYI0mVDxjtBaUKh0jR7iZHfJvQIJBNE3zqJ8hTFPIx+u6FtbFSYEk69i8hv9
	X+ftph7QhFAr+RXLGY7/KHtXFUjtatL4QotAVOJfCnGiZlaSm51RY1kosfFqiTwg==
Received: by recvd-75d778fcc7-b88jc with SMTP id recvd-75d778fcc7-b88jc-1-6AD0CD83-45
	2026-10-15 12:56:35.943893238 +0000 UTC m=+1367739.715206777
Received: from daisy.dens.ffj.family (unknown)
	by geopod-ismtpd-2 (SG)
	with ESMTP
	id FaLYkaPMTy-5adl3TLZmzA
	Thu, 15 Oct 2026 12:56:35.829 +0000 (UTC)
From: Liz Fong-Jones <lizf@honeycomb.io>
Subject: Re: [PATCH v7 3/3] writeback: switch a replaced cgwb's inodes to its
 successor
Date: Thu, 15 Oct 2026 12:56:35 +0000 (UTC)
Message-ID: <20261015125635.1051925-1-lizf@honeycomb.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-172774@kernel.org>
References: <20261015-wb-dying-cgwb-flush-v7-0-9278d9ebaf5d@honeycomb.io> <20261015-wb-dying-cgwb-flush-v7-3-9278d9ebaf5d@honeycomb.io> <sashiko-outbox-172774@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2ECuH7N2XAoeMR1zrzr=2F6NZrhli2vbKPOHff5fJuZuba6ZIE8QPyIf9mn4Y?=
 =?us-ascii?Q?ezqeFFjUkh=2FeROy4LtnO7KN9jZmeZfvQl5dqds7?=
 =?us-ascii?Q?T0yc=2FIcbPB6CYBwlP7GCfbHg3vSB3=2FwdQgaNpYQ?=
 =?us-ascii?Q?4VuG80gvYXZv6x4mpXDt3hSJhDAFfJloUo969M0?=
 =?us-ascii?Q?ELzBN2dN9WO773jTUpV011YS89sSBNSAo3CdwqJ?=
 =?us-ascii?Q?kT9Hg=2Fu=2FSFjMN2tv6Cogrc+nKsOrZr4U93FUkJY?=
 =?us-ascii?Q?SSbT?=
To: sashiko-reviews@lists.linux.dev
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?q?Koutn=FD?= <mkoutny@suse.com>, Liz Fong-Jones
	<lizf@honeycomb.io>
X-Entity-ID: u001.GRlkmHQ+Ka/CKxmoC/CxTw==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On vfs-7.4.misc, yes: isw_prepare_wbs_switch() there walks each list
from the head and leaves prepared inodes in place, so each restart pass
re-walks the ones already queued. Mainline's f6988c90671e ("writeback:
bound cleanup_offline_cgwb() rescans by rotating scanned inodes") fixed
the same pattern in cleanup_offline_cgwb() by moving scanned inodes to
the newest end, so each pass resumes at unscanned ones.
switch_replaced_cgwb() uses the same helper and gets the same bound. The
series relies on that, as the cover letter notes.

For scale, without f6988c90671e: replacing a wb with 5001 inodes took
37-40 passes, and the longest pass was 0.7-3ms in 18 of 20 runs and
10-11ms in the other two.

Liz
