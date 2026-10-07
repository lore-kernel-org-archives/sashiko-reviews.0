Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C79F484256
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 12:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376738; cv=none; b=Yeuz9v2ZiogJ9EHzdelkBEivUmuK3LAo08QnaELZmr5GlY5k5FmSCzMSz+Ai6bnRG3QC1ejoy7HTSuL4xxApUnlwkbaFq93dEvkymczHhNFFFVYl5tquA5iZUgNHM2WT+ZYnEEW8l+5HK1XR5sh6K9nkMbXan0ZahVP86FT1N6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376738; c=relaxed/simple;
	bh=Y4QmUaUTXL5/sKt+rnhffOWNi8wdt4VOD/zIx0YX3sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY9vAZ+3VBwwTnkmVzlcAKK3mdcU7pU+GnHjcFtNwdiueDnlh3cCITPTc+fyahFQfYb4kj/4e1eBMFZ/FSZUGDAE5JnFNmOaO9BC6xIb9ThmCNgTn6g5PZYPsHSfH9pLZPy5rZwAYhW/ctR97f+DheutYDmKLm+11nNjIl6cAuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=motRJLKb; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="motRJLKb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=XWiOK8jZ40zmaDNpJFrpVKMvUivr2p4ae213NrN7yRE=; b=mo
	tRJLKbr929X9Zsbt3IwAcg9Kgy2Kj2DvcjGMKby54qSOcnGXAxK7nvV6EKzzzThG/p9Zj17gf7CLl
	W+aFJGnGCPyHwOAwDKoCZJufa47KDWtOFH/t2WTztDBJP3jVqYO5mpiqC2DDVrJSaFAnJwWSG9lcA
	4ac/zwL3yyei/B8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xEQuw-009SIJ-Be; Wed, 07 Oct 2026 14:38:42 +0200
Date: Wed, 7 Oct 2026 14:38:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Linus =?iso-8859-1?Q?L=FCssing?= <linus.luessing@c0d3.blue>
Cc: Sven Eckelmann <sven@narfation.org>, b.a.t.m.a.n@lists.open-mesh.org,
	sashiko-reviews@lists.linux.dev, marek.lindner@mailbox.org,
	sw@simonwunderlich.de, antonio@mandelbit.com
Subject: Re: [batadv,v14 5/5] batman-adv: avoid superfluous DAT DHT_PUT
 additions to local DAT
Message-ID: <7d8ffb0b-ae92-4d44-aaa9-affc0dfe7e19@lunn.ch>
References: <asWbc64vRQgTKt9E@sellars>
 <5152412.GXAFRqVoOG@sven-desktop>
 <asY38NN2pGa8FICm@sellars>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asY38NN2pGa8FICm@sellars>

On Wed, Oct 07, 2026 at 02:15:44PM +0200, Linus Lüssing wrote:
> On Wed, Oct 07, 2026 at 09:24:23AM +0200, Sven Eckelmann wrote:
> > On Wednesday, 7 October 2026 03:08:03 CEST Linus Lüssing wrote:
> > > > - [Medium] batadv: UAPI source compatibility breakage via reserved field rename
> > > 
> > > I would have thought that for a field called "reserved" it would
> > > be clear that it'd be subject to change in the future.
> > 
> > To play the devils advocate: But programs would still fail when they 
> > manually initialize this field to 0.
> 
> On the other hand I'm thinking they should have memset() the
> struct to zero in the first place, instead of manually setting a
> reserved field to 0.

There is another general case advantage of memset. I've not looked to
see if it is actually applicable here. It will also clear any padding
bytes, if there are holes in the structure due to alignment. If the
padding bytes have always been zeroed, you can make use of them later.

Also, for kernel to userspace copies, you avoid leaking bits of the
stack to userspace, both in the padding holes, and any fields in the
structure which don't get explicitly set.

memset of a small structure, less than a cache line in length,
probably costs the same as setting a single element. Fetching it into
cache is the expensive part, once in the cache it is nearly free to
use.

	  Andrew
