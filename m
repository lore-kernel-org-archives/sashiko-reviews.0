Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794664007;
	b=eypheUDUGXUTN/M6h+1wTNVOrrcStyvOEDNu726SATsW9BO0SodGkvIj2JWcqkuSKn9O
	 wc+I15NcJYt4yUZLWw52oEBTN+TPmoCGBOIKWmL9BnfDdl9vwnIHIfp5Ysj4/y0x1JP4Y
	 nbEg2j5nuBpCvLpnI8OUEoEeKJNTsYlo8/xR3y/BB6wHjAGPzt3dW+5d+sMc9WOQIGUt9
	 yCn6e7kooqYWLtXDd23BSSHEcX4WJwczU/LvAhvJkgm4LJpZAhFsNwBvLttRAFaSC1bKy
	 tFJ7ZyjiS3yiYc5108lUHbBmCms8AUJWFTHiEx/SbTVhM7RvPOOhQstBRP285kIUFQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=BR1VC/UzZxQOEPl73tQotgFkTmmM6Ug/uubSfLUCJn4=;
	b=EE6eOgBWaFKVmZhiJTtFUrm05Wax+b7E8PFjZFOgVqR8V/VHRhwSgue1Hu61eiMCFb9/
	 j3UMSfxnHqstdlwZZGoLugtTtubncceDBAT7YDvCo5LYjrIaAbaiPO72DkzAFjD2K8+wz
	 aKnvoXLIs44DItyH8sTeJhdKpnzlTy5+vFaZPG1HpfNZldYbA29A8ThywhDYjHaPwD1/L
	 yXIkPNFLd/KVOgwpKFlba09ofdfogouo9AFpfCZAJAxglIEKGdySzkNyzqqasRonH7BEe
	 GLlv62Tr5nSqacn4L+9KgNtS85FbN++3prR1SDQb0c7pa16iWjhs9PjxdhdjNlzpCvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b3W299Qe;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CD7606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 13:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CD7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b3W299Qe
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso10468135e9.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794664005; x=1795268805; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BR1VC/UzZxQOEPl73tQotgFkTmmM6Ug/uubSfLUCJn4=;
        b=b3W299Qer9TK0+9qB5u2jGQ+uYULOf94gz9isnfzm1wgyhIfR5DsCekV8vNDLT8gXU
         ykT6bNsek/G+TqRKyYJLG8Nastw+4460zjBYRLdtlmOyXOnGK7/gMX5iEphmurqWLexh
         BD9xaWkQelY+H4/zozyRrWlqxQIJ7oAk3JshpVhlMx2hKrGg/j/Fky7S2MmWiXelPGXV
         vTzhUwQZ1/ASaclgYEhXViJyH2HhTTPUWgQWLpXuGKLjwz2buX6BFCdgvaYdMf6+RAnC
         m4wiqYaLDwOsGsga19bN1wOkN/7HrKODQiBaZYHAU2LKdEF8uii/+TkOW2BLJO8ewAjR
         h+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664005; x=1795268805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BR1VC/UzZxQOEPl73tQotgFkTmmM6Ug/uubSfLUCJn4=;
        b=I1kNaQ3dZmUl7y24Z7J2tTYeuj+mrIbqfW+jCGM4H2R1Hlm7v1h8BN35WzRfTu5GsM
         ln9zCd0kiIpoRU9vQL9chSElZMKDYlHeQH5DfQe6fzEwIhGCzL7o+8NbJSmuaGHIVGGh
         6Y32E4Q/ERn+nz/ljUjSFOmFZXt/LCRN+o/YrMJ16DrTipAOrezkASWuqQsNThzxz2N4
         gC2MOotWirujBriNb9y2Mt0mci1BySWGkkkKVKTCIHb35ZeKnnzMfoS0vnrni+adOOzN
         VMVj+1rqci2cEGXBThjPyyURebK7fcugwLryEFAJaTebmYbQiXBVj9jtC08rE4q9VE80
         r5rw==
X-Gm-Message-State: APuU4Z/EXOpi3ghDG/61vXdUT+MsIBez6PzD1dwBgfgZhErx7Xc8wpdK
	XNOPLxOwttjzZx+rJT0XcGz1F/9v+cawskYXpIqqWlkL1QD5S0/IKfV4IkTxE5i3ig52kB5wpPU
	fqebK1A==
X-Gm-Gg: AYBFou0Jl2sXzQx7/XPkgn6Cz784Rd1Wvz9Q5Nuyq1JlBFgDGSHWbRRRfyydcsw9Big
	54UnxESHayibp+aPJCBw76lzMHjRFTY74Wu2sz+LHLDa1CLR4Z+1I5C4lgaAeQaLy8yHkCGd2xK
	qZTbCK1N8WuoyQynExmAfbK8Bib/SkY+bkCfxXpxLPdHY5Qpn5eORswgBBsFutRh3sUNhFWvt+b
	FoWDnhFm8sbOQlSlzjqyhqyX2Rykr3/zatUI3oU7gFUtvUf9PSx2VY/aP7lH92Lz6oDhUcPP0VP
	u52nJCef/ey+dhUOQE9NT04lMXKkH/+ULAepxJv5ZSgelXvlGP2msUu/SDmWH0D7NJ6yiTdOzV7
	R3lNPLLcutLCUdu4aFp5wmDxNuYXoNdsoWdE7TPyXTwrpm3dpIu6TiCG69WTJBTIs0+LEG0weOZ
	A+4OPRpI+swV9XPCI3XYKpEPRfmppC/Tv0oMiS7F3gpGxEa09kKeC5nm0rd7s1SZPUqRO444jp+
	YgOHNaEvVpQ2RXj3395qWYJg+De8MfefTbFsCaC7sMF92e/FRViXfqGqFHN7ZU4kPTt4+d2KC6/
	rEZ7fSJHCzL3ogw5r+cZIV/lWNj2PoOODeR0ZcShaR2gHGZDEFgMhDkWNfelp4ejeQ==
X-Received: by 2002:a05:600c:3f12:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4bb55a644bfmr114753525e9.23.1794664004843;
        Sat, 14 Nov 2026 05:46:44 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb609cc1b2sm53600795e9.11.2026.11.14.05.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:46:44 -0800 (PST)
Date: Sat, 14 Nov 2026 13:46:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ring-buffer: Check remote reader page commit
 before meta entries
Message-ID: <avhmQDrQ5Y7RZc3i@google.com>
References: <20261113152729.837429-1-vdonnefort@google.com>
 <20261113152729.837429-3-vdonnefort@google.com>
 <sashiko-outbox-213147@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-213147@kernel.org>

On Fri, Nov 13, 2026 at 04:03:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ring-buffer: rb_num_of_entries() underflow when commit
>   precedes meta entries
> --
> 
> commit 1d2d0e6ae01d518c30dc9986893db113c38a4caf
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Check remote reader page commit before meta entries
> 
> This commit reorders the checks in __rb_get_reader_page_from_remote() to
> inspect the current reader page commit offset before checking if
> rb_num_of_entries() is zero, and adds memory barriers pairing page::commit
> and meta::entries between simple_ring_buffer_commit() and the remote reader.
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 3c7aa982d43e9..f70010e2ede77 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> 
> [ ... ]
> 
> > @@ -5825,8 +5823,13 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
> >  {
> >  	struct buffer_page *new_reader, *prev_reader, *prev_head, *new_head, *last;
> >  
> > -	if (!rb_read_remote_meta_page(cpu_buffer))
> > -		return NULL;
> > +	rb_read_remote_meta_page(cpu_buffer);
> > +
> > +	/*
> > +	 * Order meta::entries read before page::commit, most likely paired with
> > +	 * simple_ring_buffer_commit().
> > +	 */
> > +	smp_rmb();
> >  
> >  	/* More to read on the reader page */
> >  	if (cpu_buffer->reader_page->read < rb_page_size(cpu_buffer->reader_page)) {
> > @@ -5835,6 +5838,9 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
> >  		return cpu_buffer->reader_page;
> >  	}
> >  
> > +	if (!rb_num_of_entries(cpu_buffer))
> > +		return NULL;
> 
> [Severity: Medium]
> Can rb_num_of_entries() underflow to ULONG_MAX when an event is consumed in
> the window between the page->commit update and the meta->entries increment?
> 
> CPU0 (writer)                       CPU1 (reader)
> -------------                       -------------
> simple_ring_buffer_commit()
>   local_set(&page->commit, write);
>                                     ring_buffer_consume()
>                                       ...
>                                       __rb_get_reader_page_from_remote()
>                                         rb_read_remote_meta_page()
>                                           /* caches entries = N */
>                                         reader_page->read < rb_page_size()
>                                           return reader_page;
>                                       rb_advance_reader()
>                                         cpu_buffer->read++; /* N + 1 */
>   simple_rb_meta_inc(meta->entries, 1);
> 
> At this point cpu_buffer->read is N + 1 while cpu_buffer->entries is still N,
> so rb_num_of_entries() evaluates N - (N + 1) = ULONG_MAX:
> 
> kernel/trace/ring_buffer.c:rb_num_of_entries() {
> 	return local_read(&cpu_buffer->entries) -
> 		(local_read(&cpu_buffer->overrun) + cpu_buffer->read);
> }
> 
> Until rb_read_remote_meta_page() runs again, ring_buffer_entries() returns
> ULONG_MAX and ring_buffer_empty() returns false on an empty buffer (which
> also prevents trace_remote_try_unload() from unloading an idle buffer).  If
> __rb_get_reader_page_from_remote() is called again before CPU0 increments
> meta->entries, !rb_num_of_entries() evaluates to false and it proceeds to
> swap_reader_page() on an empty buffer.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261113152729.837429-1-vdonnefort@google.com?part=2

This underflow can happen if ring_buffer_consume() is called directly. But
trace_remote always tests ring_buffer_empty_cpu() before calling
ring_buffer_peek() or ring_buffer_iter_peek().

-- 
Vincent
