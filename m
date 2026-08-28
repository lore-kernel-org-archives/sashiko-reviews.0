Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BA82848BE
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905484; cv=none; b=kWv3i3+GTocibHXkjWzNw/qO37ndufSDqj80PoD2N3L8/iV1B7OPsPOe2ZY470cgNcW/VFK+7mDqwtu4P2fS4FaThExqGLqTjaYvb8iCaede4Vu+HEuhVhnHiTq5Xsv2IcMsNQetyRKdUH50MkyGLJqjqYcLOPryFNTqA9zZWfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905484; c=relaxed/simple;
	bh=1O5Q9iW7lI4chjQDzpIGp7IIC7IqqwCpT7ZNZFUg+n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJuvveVPPimZnAgKrQaMpuFa6OJNneyqRr5vdv1+Y4FDCpWthZqp7t2xgIBRDHfpmpUTeyBEC1xOo6qNDGDbUINzoE61xWnNl8dI0j+i7wjHnShy/pTm0/G2WDacRMLEhb6idpV21lhiDa0RM0P1WOkTGdsWSfNXRzq8P9XxndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X8PSb5fs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X8PSb5fs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f96c5b722so411660f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787905481; x=1788510281; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O5WOzevUigWOfvNP1ZBXlR5N6XrxbOpV2Ns+iGTIr5g=;
        b=X8PSb5fsetAf8qp+Ol4FSxILECmpOKF0jIYrArAedvKGV46PVovbl6NEcRn9WDqhVl
         ap4LKFf6i/TL9+GpvUEeafB803VJ5TL3/yr2jRiVs1LdhBaKLaxlCHwCYmdLp9Li3KnP
         Iwlo02W6n3LLfl/HJ5gh4UoQsxK8aaulgLB0rVl0g8/Dm1dNyAY5HM6Eit9AXJPfzWRw
         v0xxy6BNexEAxuwj4nXYB9WaZ/4KMp5A78g7hOWAsyR62+m3jrvzodHc6LtNgJPnpbVm
         +7lXRqoJ8PK4GGPKo2g9QP6FBwyS/EfULFk8sL92lS0GgzwIAKxpBcFc8d3WISNB6DGs
         nWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905481; x=1788510281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5WOzevUigWOfvNP1ZBXlR5N6XrxbOpV2Ns+iGTIr5g=;
        b=AgJ51+R0jWhLhCfip5lJv3uxhvXXoSX3BaFevatejWYiD+dOydpghKAQoGoLfynzYD
         YHViEkjiVQJfofSS3p794zUa99TsjMsMrm7WqtmrecKaJ7XnhiWUj8RIxWHiq2Z1mD6v
         Yu9m49pd91FdQ42G4rkbsQC1JZvcIkgUIWt4C5b4vX0qWyATyN2hO1ZZ3wko/Md6Hpsx
         El8fWtHuW617UTAdSrxxZf+lnh3pWLgf/4YOsr8kGFXjF0wW87vlDKb4E7Qpr5BC3Dlg
         PoezMGTghLWcPfzYEM6VC+qquHAxXDCpBHNbchSwcFGGTt8xjXzJuWHtO5BK3E00TuaV
         rfqg==
X-Forwarded-Encrypted: i=1; AHgh+RpnHbQbiMog7+aaM0rvmre8R0rdBVhiKI1pWxhUzuT/qs4MiSnkwBTaSh5B1EPHNxlVR0BhOBY7Ff0lOTGRHYQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nVTVBZIPzdk1xXrMtmcYo+f5l2hQG+63b6k/+r4/TcJoqTubpv
	jh8xCBHwRFBbwOE4za5Ayw92TI/DZfYzU+3j8x6mdjP4KX0QrqxhsxLHAA31+jV+lV4AwCN8fAH
	pPhz/PFNK
X-Gm-Gg: AR+sD11yEsPlTaIGOW3QFP2Re3t+eMz8NF7ZknDvfR/kbIu9x7KR983VXAh6a7Zjzm6
	2fmgikAKFRrKPyGLM6EXM0QOG3q26L/GaqMr4yCtFHnYPW54PEu+P06w37qAwz9rkM/QyOi41fV
	ytZmrFcOYZIpwIlrngnf3RedfeYqD2CCNy41dZeCwDoc3LDmLGeVlDx8sVCGtOLvmD4+uvdM71H
	1wZJfHisZ2EVeyECBr9xko8gLXF0feB1PjRv65Bm0NIiB0JMb1Q9GBXWIVEbz03uljm+3ZAika0
	EET23YU1Vo09UBUXeQB0s9VVjUpX54CAbPAlW+kR7Bl7NE2aUBCOHd7HrZdVI48Wzp1O87RqFzI
	rUT+nBaq8MAD7lwh/eyLGvQeRAUp9x0Jr9AemfVpVcW3xzJlAx+GC3+askdDlgWAayn5dhTpXL+
	IpkZ0k71nNxxjCVxOabSGwRFY7A4mnjz9Jr041w77J0g1xSDKW4qiKeDXnYOn9tR4crl0CXQVkb
	IyF96928r7OehIUvC3XO0VGkaWLts4k
X-Received: by 2002:a05:6000:4008:b0:482:e2f2:19cb with SMTP id ffacd0b85a97d-482f79870f9mr6942058f8f.5.1787905481031;
        Fri, 28 Aug 2026 01:24:41 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2072csm2023866f8f.23.2026.08.28.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:24:39 -0700 (PDT)
Date: Fri, 28 Aug 2026 09:24:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] tracing: Fix subbuf resize races with
 trace_pipe_raw readers
Message-ID: <apFFxOw_DUUChws5@google.com>
References: <20260826094528.3738023-1-vdonnefort@google.com>
 <20260826094528.3738023-2-vdonnefort@google.com>
 <20260826095947.4FF8B1F000E9@smtp.kernel.org>
 <20260826103736.2b55b464@gandalf.local.home>
 <ao8TQ-SvhjYgy43-@google.com>
 <20260826143123.1b3e3854@gandalf.local.home>
 <ao_Zu0ThaWThj9YZ@google.com>
 <20260827091541.5d03e33c@gandalf.local.home>
 <apBhLDTEa_3yYZP5@google.com>
 <20260827153314.77218528@gandalf.local.home>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827153314.77218528@gandalf.local.home>

On Thu, Aug 27, 2026 at 03:33:14PM -0400, Steven Rostedt wrote:
> On Thu, 27 Aug 2026 17:21:39 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > On Thu, Aug 27, 2026 at 09:15:41AM -0400, Steven Rostedt wrote:
> > > On Thu, 27 Aug 2026 07:31:23 +0100
> > > Vincent Donnefort <vdonnefort@google.com> wrote:
> > >   
> > > > Looking at the function again, shouldn't we add !rb_is_static(cpu_buffer) as
> > > > well to the full page test?  
> > > 
> > > Why? 
> > > 
> > > -- Steve  
> > 
> > So that the splice can make progress when the ring-buffer is presistent or
> > user-mapped. Or do we say that's expected behaviour? 
> > 
> 
> Ah yeah, I see. Hmm, looking at the code to see how this would work, I
> think I found another bug. Let me look deeper into it.
> 
> -- Steve

A bug if we allow rb_is_static()?

If not, shall I add it to my series?

-- 
Vincent
