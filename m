Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F23222597
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980625; cv=none; b=c2peP8ao39wf0YOShtspelw5O8i2ZQavuuwRNSM3OAd1LFKejgncnNwko7IcFv4PNh8EqZB6bicpt75jQSNdRJ5YcWZavGjAjWksdBzopRNGa5zvid2Ljxz3tVJel8ziN4bDxXrgbjJI5kTbcfw4TY0nWEix9dlYbR2soBd75zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980625; c=relaxed/simple;
	bh=Jtb7MBCUpRL3r8wUI5sHpryZ8uYbVER3YKn7EGTZ2Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlN9TgM0jZpnQWNUmBix3T/m3s1mYcrRA259aDdBSwWNDBg1Cu9VjcWf0eezKqtddNQyUH6zSZCBRhf+0cyO9MqSKpkE7zQr3CXqfhi78RiEm7I2ZY9KAzW4rvkXsK9GwvVL4j8sKlfPE9H64ibvGDGVV0w3Yb4bjT5AUFpA0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=SP0rJq+m; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="SP0rJq+m"
Received: from macsyma.thunk.org (pool-173-48-113-153.bstnma.fios.verizon.net [173.48.113.153])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 67HFUIYc014817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 11:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1786980621; bh=5lP2TF3nDkDFNL6YrkIL6wAMOBQnkc2dy2i2C2gWJjM=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=SP0rJq+mYyHH6fjKG2UBuey2VfB6e+YfRi23qUvu9vZ1kkBovd8r+o+FZOS5ltuq7
	 F1RBcmPKzauhvj+Drw9I8eSKkU7ofJvYxx5EPJH7Rex8DngOerVnuf/vbBX9pkBC9R
	 vDkBNc1dyWGRsI6UqsgN910kHIPemOz5dKe386cMPtIAoNMLGqQc4J2vH5vG4GFIy9
	 WRG1Vst7GSUqd291hKYAtNGYZ9JXFkxf3LTXDsqjaZySQhyWIEjOnLWwJqeOdpZtSv
	 NQWRq5y/9Z0L9pQc5p9MYvl3EW6MkeS/wsb1uk6TM5GWLA8j2jK32iJHlXXWbRsbda
	 32NCt0mBFgh3g==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 76848F595D6; Mon, 17 Aug 2026 11:29:18 -0400 (EDT)
Date: Mon, 17 Aug 2026 11:29:18 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-ext4@vger.kernel.org, jack@suse.cz, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] ext4: compensate ea_inode refs and free block on new
 xattr block write error\
Message-ID: <aoMe0uuQnGovxMSH@mit.edu>
References: <20260817100724.923291F000E9@smtp.kernel.org>
 <20260817114905.2708356-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817114905.2708356-1-matthias.goergens@gmail.com>

On Mon, Aug 17, 2026 at 07:49:05PM -0500, Matthias Goergens wrote:
> Sashiko's reviews on these threads have been genuinely useful — the
> ea_inode refcount leak that this patch follows up on was its find.  This
> one, though, is a false positive: mb_cache_entry_delete_or_get() and
> mb_cache_entry_wait_unused() have been defined in fs/mbcache.c and
> declared in include/linux/mbcache.h since commit 3dc96bba65f5 ("mbcache:
> add functions to delete entry if unused", 2022)

Yeah, I had noticed this and filed a bug against Sashiko.

https://github.com/sashiko-dev/sashiko/issues/439

(Filed before github went down.)

					- Ted
