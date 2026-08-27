Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847692C15AC
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812293; cv=none; b=AebUTNakV8cgJkircBMeB94y1Cnucq6pMoUQrqQhvUG4d72wGWqap4Rt3bqRjUOhtDaNLDsr3nmYAwbVFcp/264OqkOJqhIHTypgQYSHLJCgqadAt33jZmkuhhmteFSbaHmP/3HFfdmctPaDD0TTGmWO0M4qXnlyUzV/jOqXtB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812293; c=relaxed/simple;
	bh=PQJW0gtfjQdQxKlaVpGRswhwcfYlvbiZR0iPxcWW0nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMSvUSckkgLVMRw0LKRiuMGbNcQ96dHf0/BMnukgDENRFv7+auh3X2rqyP+icOZe+tqbFw7uVFwxv7r9lSru4O+33SQVGkVcLa+gAUfkl0bR2sUazgRorC99NullwN0QKA0sUT5D6stfZIkZYB7yDBJMYWT9mWzjDyw4+EMKfTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rNAZWBEc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rNAZWBEc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49978908b35so12465335e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787812288; x=1788417088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iSQ1KNoIXoA8gP/lmKjgXg+CsD3Ak0JaTckzQJGWTIE=;
        b=rNAZWBEcDXwA2+jlzCqo26BM1nXYKA9XJuv8hPVYcCWkdxYhjveHJiUO2d0eqq1dQQ
         0Y7Ju4anfdffvSRWeyXp9UbpeVqHYNXk0PseHAbiqE141f9Q1BIPywDPK56kgUbF0dkm
         ASS2oCqif2Pmy/TJ2oNrfKvy1Ze6LBqFf3Hmm3RujzuEmX3rend917kODx/ssmrHGAD7
         KjEAmOqCR0lOkLn/QeBlOT5TmMD4lHFJZ+H4uicGrvO2/KMq5IK7STC70jKYGLKpc0IA
         WTolschqC/NHFGRW3gY725Q0sV4gtirCv04MBIJBgfptL4JMEjQiVYjjOAO0j2tVhx+R
         ALNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787812288; x=1788417088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSQ1KNoIXoA8gP/lmKjgXg+CsD3Ak0JaTckzQJGWTIE=;
        b=XC5mLSU1zYnuWQJS8FywcqwXPe5eddK/KtD1D9hdn8R4Cl4nY0TYjOGTqWwWPcSjj4
         zZv4U82J7dwufvRkRwMN/Um9rZPwY0H0VJns2kPaCrn7JcqjH72Y+jWH67UVJXe8SGoi
         z+gkVLv2MjuifXmX3OxzDGfKzC3GHNw4Z4nOV85ao7AH5dC/2hf2G7aWK7iz9MUD9ROs
         7p+JKIJaXaZGh4qqfEPl9z5WcCIotGy7yUMMkJk4nVRRtDZ8VEfbvlA/nsnsfbDSvF9J
         XdOVlANd05rfJQGdhlrYpX80HaXR/skxGviQMt+sSvsSItFTQVcJW/cqrUQ8hlPPBgaw
         SoWw==
X-Forwarded-Encrypted: i=1; AHgh+RpHt+K++LMa6Y2ypSlrghEgzOnHq1tUkwDgOc8qoapiDWJloNEH2emJw/vizO7ODyee+//5EWN9VEQ55ScMbuk=@lists.linux.dev
X-Gm-Message-State: AFuF++n5zlG/nEXjo7YSdAbl9c2xymyZRXoiZz93v2dPGb1P702nk1q4
	cm41vfyho0uKpPcw9VTjqnmJGtwbZMmQeXYSx0DIdNtTYnixTUwpn9sZhtMFGu7BwA==
X-Gm-Gg: AR+sD131SNHXBhN0CvVxOkDMQWLAm/r7+7BiT3WdrHXT7Lr240mLhlmk9L6KwBtTNBk
	oqiTEP+wsRG45mNGkSL01eW9uuJl9nWhwhKR5rjxGuP3/5MdimEuZ91llf1jPZgjSy+nw7UmNyG
	NaSrYqfu/SfCA8IWtOafcDAkpSsg3nLHKJSCpy0W38I0m6f0JgA6TGdleXw3sicx5s2r+sSXcYX
	UIu+y9mp+eu2ql7vJPBxbohFzCuy8BKr8kQEnboHXHLIjuv611dp5MLV9yRbQKbjwdObTbRT60k
	SgJPANlUFJJ9P1i0WJx+SCA/K2oBHWVSONJ4mjYSzFZdCOBjVvtCc4lQCMW28PGeYCykBsH5KiT
	nz5Gye+WBvKAdW2cDSdUzk0zNnTVv5tc/Sb6LOdLnie9pw7BrGj4x0A8eaoyRrCr/Do5jMih7r5
	lysnn+LKi3PlqcTuaRVK0SlrqyyVit7VRz+XSDhhf4BHTj9b+r5Tyuav6yM3i0OhkBYYdJtH/8L
	Mw2xe90A2GZpTik5JnLbex4ydtb2Owb
X-Received: by 2002:a05:600c:c118:b0:49b:c8e:8e6 with SMTP id 5b1f17b1804b1-49b0c8e0911mr70740995e9.0.1787812287225;
        Wed, 26 Aug 2026 23:31:27 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b8d2ba486sm6856615e9.5.2026.08.26.23.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:31:26 -0700 (PDT)
Date: Thu, 27 Aug 2026 07:31:23 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] tracing: Fix subbuf resize races with
 trace_pipe_raw readers
Message-ID: <ao_Zu0ThaWThj9YZ@google.com>
References: <20260826094528.3738023-1-vdonnefort@google.com>
 <20260826094528.3738023-2-vdonnefort@google.com>
 <20260826095947.4FF8B1F000E9@smtp.kernel.org>
 <20260826103736.2b55b464@gandalf.local.home>
 <ao8TQ-SvhjYgy43-@google.com>
 <20260826143123.1b3e3854@gandalf.local.home>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826143123.1b3e3854@gandalf.local.home>

On Wed, Aug 26, 2026 at 02:31:23PM -0400, Steven Rostedt wrote:
> On Wed, 26 Aug 2026 17:24:35 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > > This is a legitimate concern. But with an easy solution. Perhaps just add:
> > > 
> > > 	if (full &&
> > > 	    (!read || (len < (size - read)) ||
> > > -	     cpu_buffer->reader_page == cpu_buffer->commit_page))
> > > +	     cpu_buffer->reader_page == cpu_buffer->commit_page) &&
> > > +	    data_page->order == buffer->subbuf_order)
> > > 		return -1;
> > > 
> > > If the user is changing the buffer size at the same time as reading raw
> > > pages, they get what they deserve! I just don't want to let the kernel go
> > > into an infinite loop.
> > > 
> > > -- Steve
> > >   
> > 
> > Sounds good. Do you prefer to get a v9 or you fold this into the existing commit?
> > 
> 
> Please send a v9. It makes the patchwork flow much better. If I modify a
> patch, it makes patchwork not be able to automate the status updates as it
> moves around git trees.
> 
> Thanks,
> 
> -- Steve
> 

Looking at the function again, shouldn't we add !rb_is_static(cpu_buffer) as
well to the full page test?

-- 
Vincent
