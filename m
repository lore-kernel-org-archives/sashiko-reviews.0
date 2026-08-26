Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A431AAA3
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761483; cv=none; b=emGIZ6JJnXoX455qU7Yq1aZN/umBJcHAkGXV/OLNxHL8Dppl7l4SIB2w3C8vqJoM4SIHda1LVqz9taDw9w+50QInnqXjdGF+4A1YSWGpPG7A5H7yER4NQEHVis/+IMYofSrTSgQM+AMlUTrUqfSIquU2apfIh9tsbOL5MY6Hs9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761483; c=relaxed/simple;
	bh=TyOk4qc9NbEhPQXdVLDwlGeADrLSv/duAMRKU3keWRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxXCMlPzbRwlsz0MaRn3BceESpdkDOOYDoo8AEK1p1BpXRPUMiHJpI5E/hQY6yo0Z0fBKbrgSrqMn0MqEw4zSi7BZh9lRXL94HU8XCYFJroEloHIFMyzadtr+mmyEw5dKVZNA1mCRRRcDefEATLpJ0nZ6OnBMhp/0ni75OIC5+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YqXPGq6Q; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YqXPGq6Q"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso585400f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787761480; x=1788366280; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4wPhRoiAoITJ/dRbRZTHMg4nlt0LAxopK2lH03YyHA=;
        b=YqXPGq6QRLm4MrdjyrKi9S2uGm1oB6aSTidfcqmm7F6TcJ75uprPnaFvjvfRkQIzKk
         89J38q7ldi/+91ba7QREnp5TjdeWchJ78G68AGrVG4fJy/Jag24H1APRVVV+x1JcJNHC
         YSIUS+f5mFuu6EkJAPwuW/NWq7f7/TwuECw66agLIF2tTi1wboNK+EcyfFeGoDkgHQtw
         QOUJX2L9nT4CGLFVsIFLZHsmgT109tVy/u2INuFcbiIXn8rRLeu/T8j7MI6L/11jwiAF
         1Vo2np0/MkTvvE/v0yPFZWAC3tIYE/c2v6a4nTta+hKfGX0/wR+98L0iqLPWWcHXuMse
         /utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761480; x=1788366280;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4wPhRoiAoITJ/dRbRZTHMg4nlt0LAxopK2lH03YyHA=;
        b=NuCG7dQRup6LFV3SM5SZPyeuV/Rr82qu2G6/LA3DDJDiRRpLnP6Y/iX0EVaW75T++Q
         9hMKebYWdxAuEaby3OSjo1vwYHT+hyUNnH5PLFPtRwXpmhdk2AfnQN9S968w2fxXzvF+
         bUPfvBd5HRLUdyJj5PgsNRyHJVXxzank7sk8L8dhsp8RmnvCxnDKCyDi1ogaAI0GuIdD
         8qxPVupzWW9D5cT9XFtb6q8x2g47ElwNgUGZUU6Q65+cIDeA1B0JPwWVc8VwnqyhATWV
         qVRJ6L4jOT0reF19Eq0o82AWXvdSxpj/9/lNFTV7r2eMYgS81j/Kdq5bNFuwplc9I2Sb
         70Pw==
X-Forwarded-Encrypted: i=1; AHgh+Rppo3EoQFrotZ8apgfZw9gZxL0bmnyuKsAaMm9PiigKF4WcCEsR97W7fTuVoITTtGWzP5xIcC6hs0EZJPgB9TQ=@lists.linux.dev
X-Gm-Message-State: AFuF++n0FXNB1csztZhI83uGqYUJTlAHzJgT064x0bWOBdYfceOkrMJa
	pc04UwngEhG5CSKcEpVRtEDkyqZ1FuvVvfrG97Hx1lEXN5d9J1GBMKnBlgEK63dB2w==
X-Gm-Gg: AR+sD12OAyYTY8a7cXntFfI2L5Z+h/eEGUeUndwG1iPtG/zb7n84ApsNmwxAvv+V0g2
	yMIOQUS8z5OR4MVs0iuYyMq2y1ToLO70FyqdyG0MXD3ksNaYXP91Od3hL2htuEL7LEtbHylG/f3
	RcMVFHUwaclbXrM84VFM6vhL/9nwYsWUGe7M3zZsnozKfERQaXG8aM9CPKUDPzanN3Vb5TOE4lA
	/z5LfOWq7p422TpZleXSt01OJqN0D7oQsRQrQT9dLTgLiew7Cx2DNd6txPQdoeaqB5xmFvaQ6nj
	b2Kea2eUlgNUx5HnkhEcawAwnQtDJu03sPHziJHoWyXgJ/lPror4twW4e0FxPeM+q0L2Lf+NSOM
	90YxCQXQx6zJYRaAIP9WeKxujeD/3z9ZzMvmqlDw32BdxP5kwuZ9HyeDfN5FBLUbftbxBIoc2DE
	m05ryNxY/EA/hYxPYzHeV6CkFZQcKzit7WAuue8Zr7G2qyN4jgNQpoc0FhAs5EgCspwNCsMctaV
	X5N25BD1PUtFsjA59S9+4u5DL1jwBq9
X-Received: by 2002:a5d:5e12:0:b0:482:dfab:8689 with SMTP id ffacd0b85a97d-482e26d8990mr6671700f8f.13.1787761480049;
        Wed, 26 Aug 2026 09:24:40 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm3321640f8f.8.2026.08.26.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:24:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:24:35 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] tracing: Fix subbuf resize races with
 trace_pipe_raw readers
Message-ID: <ao8TQ-SvhjYgy43-@google.com>
References: <20260826094528.3738023-1-vdonnefort@google.com>
 <20260826094528.3738023-2-vdonnefort@google.com>
 <20260826095947.4FF8B1F000E9@smtp.kernel.org>
 <20260826103736.2b55b464@gandalf.local.home>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826103736.2b55b464@gandalf.local.home>

On Wed, Aug 26, 2026 at 10:37:36AM -0400, Steven Rostedt wrote:
> On Wed, 26 Aug 2026 09:59:46 +0000
> sashiko-bot@kernel.org wrote:
> 
> > > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > > --- a/kernel/trace/ring_buffer.c
> > > +++ b/kernel/trace/ring_buffer.c  
> > [ ... ]
> > > @@ -7183,7 +7218,8 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
> > >  	 */
> > >  	if (read || (len < (size - read)) ||
> > >  	    cpu_buffer->reader_page == cpu_buffer->commit_page ||
> > > -	    rb_is_static(cpu_buffer)) {
> > > +	    rb_is_static(cpu_buffer) ||
> > > +	    data_page->order != reader->order) {
> > >  		struct buffer_data_page *rpage = cpu_buffer->reader_page->page;
> > >  		unsigned int rpos = read;
> > >  		unsigned int pos = 0;  
> > 
> > [Severity: High]
> > Does this new condition break splice reads when the buffer order changes?
> > 
> > When tracing_buffers_splice_read() allocates a read page with the new order
> > and calls ring_buffer_read_page() with full=1, it will now enter this manual
> > copy block because the subbuffer orders no longer match.
> > 
> > However, just a few lines down inside this block in ring_buffer_read_page(),
> > there is the following check:
> > 
> >         if (full &&
> >             (!read || (len < (size - read)) ||
> >              cpu_buffer->reader_page == cpu_buffer->commit_page))
> >                 return -1;
> > 
> > Since the reader page typically hasn't been partially read yet (read == 0),
> > and full == 1 from splice, this check evaluates to true and immediately
> > returns -1 instead of copying the data.
> > 
> > Because tracing_buffers_splice_read() loops and ultimately returns -EAGAIN
> > on failure, will this cause an infinite loop of -EAGAIN for userspace tools
> > trying to read across buffer resizes?
> > 
> 
> 
> This is a legitimate concern. But with an easy solution. Perhaps just add:
> 
> 	if (full &&
> 	    (!read || (len < (size - read)) ||
> -	     cpu_buffer->reader_page == cpu_buffer->commit_page))
> +	     cpu_buffer->reader_page == cpu_buffer->commit_page) &&
> +	    data_page->order == buffer->subbuf_order)
> 		return -1;
> 
> If the user is changing the buffer size at the same time as reading raw
> pages, they get what they deserve! I just don't want to let the kernel go
> into an infinite loop.
> 
> -- Steve
> 

Sounds good. Do you prefer to get a v9 or you fold this into the existing commit?

-- 
Vincent
