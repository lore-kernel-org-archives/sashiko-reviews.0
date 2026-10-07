Received: from mail.aperture-lab.de (mail.aperture-lab.de [116.203.183.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136B455176
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.183.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791375360; cv=none; b=ioKf1932PUwpiWO+6GtfNYJGPwedpHFWsnV2E0+bvXli4kHAJSZKqPOc4R7/yvgFkJ+bQBXFd62IT4SrVIbR6PDnrPmFEwZStAfDWiIi70/Pr3F5m0rD4SCHoVEp8gCPT5cN6yf6/bS8uLCOfFFwWvrJE+zCjpaKf+zwZrv4dVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791375360; c=relaxed/simple;
	bh=aXvJNiaoMprn1pYDXMhTDPNM4Dy9Del1QDinpD45Z7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svOg/Mly8OLNzLG6yRQI4GnjsRo9aUbKZxltuAIStQ0R3ZEhOEAYDaSWqqAxb+KxHcI4wN7L/rueFuY4brK6HuYQUmA8M4J6yf/vPBhheaTqyYdh+YM9NyA2BWdLVlnThAuiArrDvUVBot3sjDOZ1AquJdY5ijRtcN9tCqAeRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c0d3.blue; spf=pass smtp.mailfrom=c0d3.blue; arc=none smtp.client-ip=116.203.183.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c0d3.blue
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c0d3.blue
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 650D323237;
	Wed, 07 Oct 2026 14:15:45 +0200 (CEST)
Date: Wed, 7 Oct 2026 14:15:44 +0200
From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
To: Sven Eckelmann <sven@narfation.org>
Cc: b.a.t.m.a.n@lists.open-mesh.org, sashiko-reviews@lists.linux.dev,
	marek.lindner@mailbox.org, sw@simonwunderlich.de,
	antonio@mandelbit.com
Subject: Re: [batadv,v14 5/5] batman-adv: avoid superfluous DAT DHT_PUT
 additions to local DAT
Message-ID: <asY38NN2pGa8FICm@sellars>
References: <asWbc64vRQgTKt9E@sellars>
 <5152412.GXAFRqVoOG@sven-desktop>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5152412.GXAFRqVoOG@sven-desktop>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, Oct 07, 2026 at 09:24:23AM +0200, Sven Eckelmann wrote:
> On Wednesday, 7 October 2026 03:08:03 CEST Linus Lüssing wrote:
> > > - [Medium] batadv: UAPI source compatibility breakage via reserved field rename
> > 
> > I would have thought that for a field called "reserved" it would
> > be clear that it'd be subject to change in the future.
> 
> To play the devils advocate: But programs would still fail when they 
> manually initialize this field to 0.

On the other hand I'm thinking they should have memset() the
struct to zero in the first place, instead of manually setting a
reserved field to 0.

Similar to ioctl()'s for instance, where there too you should
memset/zero the full struct, passed argument, I believe, instead of
just zero'ing individual fields as there might be new fields getting
appended in the future.

Interestingly, include/uapi/linux/ethtool.h has an explicit note
for this:

```
  26 /* Note on reserved space.
  27  * Reserved fields must not be accessed directly by user space because
  28  * they may be replaced by a different field in the future. They must
  29  * be initialized to zero before making the request, e.g. via memset
  30  * of the entire structure or implicitly by not being set in a structure
  31  * initializer.
  32  */
```

Which we don't have in batadv_packet.h though. (So technically,
someone could complain about such a rename because we don't have such a note?)
