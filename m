Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34752478E52
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636989; cv=none; b=p1Ru1TC+1U5QXt+pY3Kizd/n6QZYfKUL+q4w7yK3+xG9qxh5Mgjnf1y2p8Y28HuC4Am49VljE70F0iruRfEjTyvxBjUN5inI4nHeJxmznzPRusNO2EaLcUfmwq6ztCQLAK7TB+VHSq8qfYd1SRPRjU0Q3rmLutZYyXODmC+0HOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636989; c=relaxed/simple;
	bh=SKsbIEp8R4pXw1IRNNNSLjpPn2PWGslZn1iXKYSQdXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv7zTHA+RCyNjUjx0CIUMSdB1hbEzWqIJUn46zg7wzbNDgXiRXZrHi60I7tS6HMNFvmn6kQ/OzogXFygl/FXrwGUK02ieyz17862EdJWd2PRF+2JaYFl8RxsKJnlbqZV4XYlCi1zrV9wFANbUj/QzWQDO4rWoPJlcDo8BLoC/ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MnLbsdcu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MnLbsdcu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe377a217so1451563f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786636980; x=1787241780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=treW88TWQM0npumBYWNuqQc/1poh2s7oeF0WGn40048=;
        b=MnLbsdcu5U4f7rMXlz+kSv3Q7/KXsb1m9cuK04jyWmXphYWm2Prfsk+TUrg7Iol442
         w+1iggWG+25OTIi+92kFri8+pbpIpDHPdKk8JipyjaslkOn7JttIXKFjg6jGGC8FOh1V
         /96hHD8FjRVE/9J5XAGOqimx/V5UbrhzKcdkhYdWcJwYosAzOQp6r4D0oe61DZ2+4ELU
         YViBKJpS+OCcj9kphJQd+xod0/oD/PYha69DUe8mHyUwW3xOUk8wr43tkY8PP5dZJS7L
         0NM2rSL0XIW4qOfQZRAXMirgvqSERmqXj2USdR7Un6IbtafjMy3nF8bdtyynhVph6Mrp
         /SJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636980; x=1787241780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=treW88TWQM0npumBYWNuqQc/1poh2s7oeF0WGn40048=;
        b=l1ctv/yBNUGApacXz5waKfUHOnV/5JFHvk8bcYrsjDifglmWTGgeaT0Zxy5AEXJIWJ
         7i237fW8MLSqDCpIymFcJMpHuOwe5ihLbS57ftNS9W64uTcm2rEkXFjFUZ8gfNVBFjvk
         2Si+RNRzOF+utzLMwz0o2T7tJWpudBW+GQSZiqjuxyrDNdj5ysxbdS1VlEQfoAHc3+TH
         U0LgDGPdcDBCpGiyn16Ej2UlvP49JIsk9lX8ygQwJN0YXNa0v5PyIXLE5tIPaG7hhqMD
         zz1XFAnmgZ9gZrQIusRDeR1ZbqHwAjn+QyCr5tRiBCkp96Nc8Pyrmh+t+4hIvWIIIuzJ
         EwxQ==
X-Gm-Message-State: AOJu0YxZ15FdVIx3T4sMP9VKkHfxhZl2T5mhJ4iklARhbI21+X9j8FZ2
	WraOPEPp4U8QuDTzgXa3PU0/mNRQu263LCgBQbfuoIVnqnk8pWG9mJCHOa0CU6E2/Q==
X-Gm-Gg: AR+sD12EQ/NkalzM/thsDY+fY3MFrlypyfXnSHFR0gYHYD2y7HS3I5b26l3lE3rqoHF
	i3noHqE86xbbUMMZ32XAfbSm5G4sfe2RLQeTLyzSyd8aebgi8Jy67nMfTqVoX36cbFG8AT1qlrh
	uNyki3laPFhz64SZhrKv6ZQrAn3eM/n76WnyBzEWPJimpJvPjwr/HZS2cUyqF5VXq0FR/mt+/aS
	IqSdiMrfIJXkxxzbDI1964YPVxOH5l/x5zPRWYHJ+1nXk4muT7+XRhX2W5smoyix1Vq4cUd66Qy
	8dlVyev6MEMMbOReRByRI5CdDLlI2iaGTpNlR7Uzz9KZqNdZDCzQsTDxvuy5ZM2pz+Vxk3clNF7
	rqJorSlIx/CJcEcjQ8rK+VnPjUf+iYniZDv00tov8ts8rYhQ58t/0dpsBEMqpVqLDb5y0LE6gIX
	bdy0sqkfi8eyFkVjH1F/8UqrvCZmdmzD3NSrj2F37VlH2PyHTx0oRbLhPRtmiBe2F6UcjbmmbDB
	+ZH65wFHWX1uJT+6NoZyoM02pu77eOk
X-Received: by 2002:a05:6000:4619:b0:47f:9de0:c27f with SMTP id ffacd0b85a97d-48159c9031fmr11468648f8f.1.1786636979725;
        Thu, 13 Aug 2026 09:02:59 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1d9bsm288102f8f.24.2026.08.13.09.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:02:58 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:02:54 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/10] ring-buffer: Free cpu_buffer::free_page with
 subbuf_order
Message-ID: <an3qrsYnQJ7ovwhQ@google.com>
References: <20260813131152.3589632-1-vdonnefort@google.com>
 <20260813131152.3589632-2-vdonnefort@google.com>
 <20260813135439.E42E01F000E9@smtp.kernel.org>
 <20260814004932.4bf99af3fd65e8132142d335@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814004932.4bf99af3fd65e8132142d335@kernel.org>

On Fri, Aug 14, 2026 at 12:49:32AM +0900, Masami Hiramatsu wrote:
> On Thu, 13 Aug 2026 13:54:39 +0000
> sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > 
> > Pre-existing issues:
> > - [Critical] A data race and locking mismatch between `ring_buffer_subbuf_order_set()`, `ring_buffer_alloc_read_page()`, and `ring_buffer_free_read_page()` allows `cpu_buffer->free_page` to cache a page of an old order while `buffer->subbuf_order` reflects a new larger order. This leads to heap buffer overflow and buddy allocator corruption.
> > --
> > 
> > --- Patch [1]: [PATCH v5 01/10] ring-buffer: Free cpu_buffer::free_page with subbuf_order ---
> > commit f550c0bfeadcc22eca47316e1820b4d91f6ef261
> > Author: Vincent Donnefort <vdonnefort@google.com>
> > 
> > ring-buffer: Free cpu_buffer::free_page with subbuf_order
> >     
> > When sub-buffers use an order greater than 0, cpu_buffer->free_page is
> > allocated with subbuf_order. Use the correct order for
> > cpu_buffer->free_page.
> > 
> > > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > > index 2667992f0aa29..a3d28b2e2c94a 100644
> > > --- a/kernel/trace/ring_buffer.c
> > > +++ b/kernel/trace/ring_buffer.c
> > > @@ -2631,7 +2631,7 @@ static void rb_free_cpu_buffer(struct ring_buffer_per_cpu *cpu_buffer)
> > >  		free_buffer_page(bpage);
> > >  	}
> > >  
> > > -	free_page((unsigned long)cpu_buffer->free_page);
> > > +	free_pages((unsigned long)cpu_buffer->free_page, cpu_buffer->buffer->subbuf_order);
> > 
> > [Severity: Critical]
> > This is a pre-existing issue, but does this change expose a buddy allocator
> > corruption if cpu_buffer->free_page contains a page of a smaller order than
> > buffer->subbuf_order?
> 
> Hmm, I think you have to fix cpu_buffer->{free_page,subbuf_order} race issue at first.
> Let me try another series to fix it.
> 
> Thank you,

You mean this one?

https://lore.kernel.org/all/20260813131152.3589632-4-vdonnefort@google.com/

> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

-- 
Vincent
