Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC0E353A69
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555489; cv=none; b=rrQrSAUTLzoCKsTy5bXwFqvFVDfZ6L/JOqJ99//dIX2J5DuSTgGrqMwQ3AAM8/uFwBfyyyevLRhiFuzabxGlSwlUJXNg2teQOJ+8Yd5i95qF4Lo5MeEHciv2/A2qt3Gc2Uy5XY/hOrRcESa/2HZvBtrEt8QPe5LESUfzDWI0dXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555489; c=relaxed/simple;
	bh=2j4aWJMcmWD6bSTuB2nMvwIxDhyugq7BLl6tUfadWmM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsG+j7rSXnFyT8ZVF6oXTR8VKSWkphquZ8JpGFHGpn7PiXhTJs68/jo++MmXYY5ZPFwcMoCtb9gekQxDLzzNsnDiUYdcghufAjUq2CoI6+nxoWrw8tBDXtmafSvXgOeK7UAv86O8Tfni3SR3wC8fnRX039XVj8ab7DtTs7oex6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 0361C140353;
	Wed, 12 Aug 2026 17:24:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 56AF72E;
	Wed, 12 Aug 2026 17:24:43 +0000 (UTC)
Date: Wed, 12 Aug 2026 13:24:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Vincent Donnefort <vdonnefort@google.com>,
 sashiko-reviews@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] ring-buffer: Fix subbuf resize race with ring
 buffer readers
Message-ID: <20260812132457.69d467ce@gandalf.local.home>
In-Reply-To: <anyi-W-fZHqCPRZd@google.com>
References: <20260812153311.2328812-1-vdonnefort@google.com>
	<20260812153311.2328812-4-vdonnefort@google.com>
	<20260812155312.ADF031F000E9@smtp.kernel.org>
	<anyi-W-fZHqCPRZd@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 56AF72E
X-Stat-Signature: ascq9xfpeow5daihs8xxx1mbwsgkj1ja
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+O4pUH8y6MVYOy8YsTqWGQiiIShEB3dp8=
X-HE-Tag: 1786555483-299351
X-HE-Meta: U2FsdGVkX19mPhTGGk5uMysFGik6Xg6WA9bBBYcVFS0nKdfuWkJ/Lqvc1FTloem9CqlFKtrhchXDe7YKAo+CcF4sASkfX08jr8oI437kgnj0+ErCKPUejObgt7sHq12H6v93w7h7ZP/iWm33FXVashyqtv16KXcjY3O+/a+b6tcJdHCiTTgM/D/LqRJEW5RSO4qUijhMk9ncFkaUp75ZIkH3XCy3XPPELZYkF8ypHAZyPs7MlOGwVIlIF4Bz5M3Zzw+OPizD9JaHXcw8cgOp2N5JIBeM8ma/jsN2HEl5XKwcP1BiypwTv7GPaArHKul4quJ8fbjKz8H0wnSV8sRnm2pJmc7iXQHf


Hi Roman,

On Wed, 12 Aug 2026 17:44:41 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> > [Severity: High]
> > This is a pre-existing issue, but can this 32-bit integer capacity calculation
> > truncate large trace buffers?
> > 
> > For buffers larger than 4GB, the multiplication of old_capacity and
> > buffer->buffers[cpu]->nr_pages can exceed 32 bits. Because nr_pages is a
> > 32-bit signed integer, the result is truncated, and the buffer is shrunk to a
> > tiny fraction of its intended size during a resize operation.  
> 
> This is fixed in a later patch.
> 
> >   
> > > +		nr_pages = DIV_ROUND_UP(nr_pages, rb_subbuf_capacity(buffer));
> > >  
> > >  		/* we need a minimum of two pages */
> > >  		if (nr_pages < 2)  
> > [ ... ]  
> > > @@ -7896,7 +7941,7 @@ int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
> > >  			 * missed events, then record it there.
> > >  			 */
> > >  			commit = rb_page_size(reader);
> > > -			if (buffer->subbuf_size - commit >= sizeof(missed_events)) {
> > > +			if (rb_subbuf_capacity(buffer) - commit >= sizeof(missed_events)) {  
> > 
> > [Severity: High]
> > This is a pre-existing issue, but does this create a time-of-check to
> > time-of-use race leading to an out-of-bounds kernel memory write and
> > VMAP flush?  
> 
> This is fixed in a later patch.
> 

Is it possible to have Sashiko pull together all the patches so that it
doesn't report bugs that are fixed later in the series? I mean, sending a
patch series to fix a bunch of issues shouldn't trigger Sashiko telling you
about the issues in the early patches where the fix is in that same patch
series later on.

Thanks,

-- Steve
