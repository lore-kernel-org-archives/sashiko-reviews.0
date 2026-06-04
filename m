Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753BF3AEF47;
	Thu,  4 Jun 2026 19:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601443; cv=none; b=dRy6zi5MPtIK8cKEUYNyCp92IW8SqeTTZZyQPGM2WuhZfYaGptzJ+khY02Th2mQeaj4hkKB9uzCh//SF2x5928lsJIzcAMcgk348RPm7MEtKkx8qiMDsU7OpKKRcfFfRTwafCw94/p6YWUAyGMIjN2mszJb0npk0llqJudx6lQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601443; c=relaxed/simple;
	bh=Pin8H9BogkJ7U717XiJLUN2vmpYZFYMvJMGkm2VhZ1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP0TRkzlCAdoP+tcS6BLrA5qGC5x5T3xJX2A93ej3RqeurIGMru775mM1oIjpjoLzjRNSq3ZxuV7XXHCmWsEHaXfLr+bqoTFw5uhBCd679RdHkXe2ybz8qyDd6xaXMJ2LE/YhJgv2AER0oUDmSWGGzbIFBcN4ML6Wc+f4q/sotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWnHP30x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWnHP30x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3A91F00893;
	Thu,  4 Jun 2026 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780601442;
	bh=oNcPvIY/PL/9K3Doc4NxgXT4TXrB146o28IS/0HWf4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FWnHP30xglry+v0j2mbdw3Sr8mFJCZbV5f97LYzjV6Yhws9RlyAp9BsxA8xlqwgaw
	 l3iZVLZQk3KwO92yfb1uzEI7MOmbGPE4GyO0KkKJ68XUh+3OXvoyozrflv/m5YmF5a
	 /1cWjLuJ9+83MoOFSOU/lZ5ad67oLjFvLEYhF1iPRxWQsLkheLkmn4n4cXnVdUbGyw
	 Ka849exeLq3PaeUocTIUZmtHtL+nSAI/8BIABbQkkBuIFbwsYXM3GgKkyMyWSopgoE
	 sjzmeQvbFQBfjkc0S11sagHHzp4n6ffYXQnYu6JuJhaNJvzbZHWaT2VN/wsgEQ2ZFx
	 38DnzBwJVCdDw==
Date: Thu, 4 Jun 2026 14:30:41 -0500
From: Rob Herring <robh@kernel.org>
To: Wandun <chenwandun1@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] of: reserved_mem: avoid stack buffer overflow in
 fdt_scan_reserved_mem()
Message-ID: <20260604193041.GA1057262-robh@kernel.org>
References: <20260604073611.3954433-2-chenwandun1@gmail.com>
 <20260604074520.D5B181F00893@smtp.kernel.org>
 <757480ae-2d7d-40e9-9900-edd14ed3b3ac@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <757480ae-2d7d-40e9-9900-edd14ed3b3ac@gmail.com>

On Thu, Jun 04, 2026 at 05:18:09PM +0800, Wandun wrote:
> 
> 
> On 6/4/26 15:45, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The newly added bounds check for `dynamic_nodes_cnt` is placed outside the block that evaluates whether a node is actually a dynamically-placed region, leading to spurious error logs.
> > --
> > 
> > commit 6a79f526de5e1185b7c79fb469545f4094fb402f
> > Author: Wandun Chen <chenwandun@lixiang.com>
> > 
> > of: reserved_mem: avoid stack buffer overflow in fdt_scan_reserved_mem()
> > 
> > This commit adds bounds checking on dynamic_nodes_cnt to prevent a
> > potential stack buffer overflow in fdt_scan_reserved_mem().
> > 
> > Link: https://sashiko.dev/#/patchset/20260604015332.3669384-1-chenwandun1%40gmail.com?part=1 [1]
> > 
> > > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> > > --- a/drivers/of/of_reserved_mem.c
> > > +++ b/drivers/of/of_reserved_mem.c
> > [ ... ]
> > 
> > > @@ -341,6 +341,12 @@ int __init fdt_scan_reserved_mem(void)
> > >   		err = __reserved_mem_reserve_reg(child, uname);
> > >   		if (!err)
> > >   			count++;
> > > +
> > > +		if (dynamic_nodes_cnt >= MAX_RESERVED_REGIONS) {
> > > +			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d)\n",
> > > +				    MAX_RESERVED_REGIONS);
> > > +			continue;
> > > +		}
> > [Severity: Medium]
> > Will this bounds check trigger spurious error logs for statically-placed
> > regions?
> Yes, it indeed, will fix in v2.

I now have the same change (and same problems) in another submission:

https://lore.kernel.org/all/20260603152709.941788-1-ekffu200098@gmail.com/

See my comment there.

Rob
