Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E04477FA
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776753; cv=none; b=Lc2HJpfeyo9Rqx8LdB9S5XrojzgdQXrF3GblYeyLJkCY/8APiWd2AP08Euxwk9ZEk2JjPF+/Cy8q97OyDPKrITuoNxYUFsOc3R2jE/ejI6rZhJbPCXabKsl4dRWaBS/QoKJtncLZk3E9D38F3bXc3vgQbRmhWDsHJLIfRLI33wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776753; c=relaxed/simple;
	bh=odSsB/u5yBK0p7NUXbxRT6g1aXnxRYVHZujTKirCCxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=m4AqODFGe3it8P40RgAPSA3Ipd9FF8DPSZGfOOh3c5Iz0IxKsNW7HX2xv5xcXfKA3GHGwjsTCdsCZiMCpCOTmDE59QO7CsDDTUI15NB37nkRCx/7EVnpNzo7xTJFHBUGtOnstSnBuGc82fur+lUXqhQMJ+3USXTgfbLwebTnM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K7XKJepA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K7XKJepA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788776751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RojMlcyBo8KXKoX/Gtly8ZtzkjtceoUdIGXGbeR2hGw=;
	b=K7XKJepACoVAIu1jiUMiWOd4cdtC1eGk1hcQnrLwiFU/ThC3sq5jGIhai1t61WjqdOYEm1
	13yCUtVD0Gs1676LeDJ3Vi04j/uzodt/cnlL4OaCTL7tOlSYcusvHGpJLP5Xr4VtA48/35
	3Tksllc/3uJxSeQ0d0cgFBGMRDccGFU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-ybGxq_8fN1mJ52xWlqGK4A-1; Mon, 07 Sep 2026 06:25:50 -0400
X-MC-Unique: ybGxq_8fN1mJ52xWlqGK4A-1
X-Mimecast-MFC-AGG-ID: ybGxq_8fN1mJ52xWlqGK4A_1788776749
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495529a93f9so33060835e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 03:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776749; x=1789381549;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RojMlcyBo8KXKoX/Gtly8ZtzkjtceoUdIGXGbeR2hGw=;
        b=YTDPz5Qxpy+eAZZ0TCtmGq6Jcrnd9S8LIPFCr4Y30MzYq/yxjsvbE7znzC83fxek59
         WogNIyqM251K51XoU9s/U1L5me/+RYANuCJYj8vC882z7fX3dyCrbxfc63Dha8wdVHIk
         70/0uU5548SvNN46/y5KKXOPnvMHMU0aXi43sWOlITjf9J1y1+2JNa/8lUyvxUxIE38L
         GKLLfL5psVTMlaiQ+nE5VeRIt1560gR4PuH9twkwmCfeX+6LwZjYRbC7XnrMpxg6RH+C
         z7eSwC73dGksBl90TvglNIlc7EM0JfEtquPBKFWg6FTaNNFeJF1e9H/VVeHp1mItIy5X
         vt2g==
X-Gm-Message-State: AFuF++kWzzl8gkn3PuCP5HhIU4eyMYVzDtcqFlc47PiFQQzI7gqlP2CM
	KYqlbDZbsx4nnWzNnN77JVOEipvWxnI5qkSGaLuvnv2+pMd+bWsc1GwhqrACc+z5NveW0pwb4uw
	ZBHft1v4obXYbfWUvkvAXtonp6XhGRFkCHnKkb/u/rqKv/W1hwHaY9xXUlXKvVRL61weGaw==
X-Gm-Gg: AYBFou3h7qMq9KiCCab4Hy9ZOH31npAQUhw6pevr8TEsoDOiSW8TnKT1cgGVQg8iMbX
	4JRswM952KKJKWYEQbLXSAfEZ9s6tgz1Yj4Wt7ppQkvo3B2tAdkuSJ3Y2xYCmsbaG6zwpU3usrR
	WrOsqv89i6o+CyvyeHn26aRqaeyJjyOjqwoOdXJyUq9PXyw4QhEjej0XTRsP3SFPNjbeA65VR6b
	9drWj2J4YkD+WsiYpS/nHl8glXwM15ZF47GMY866nPTSxTiVsXlIJ1Gl/pDZe8Z3nbel0Vtq1Ae
	48mttnZfbBJqqlyqTBS0fixPcchk4F47W24PwLJPkwoIhsZFbGFQle6bZVs3hIiStkAhfb7suqR
	sHLxvbWBobaI9uSWXdAxerFI=
X-Received: by 2002:a05:600c:4e49:b0:49c:fa20:cc05 with SMTP id 5b1f17b1804b1-49cfa20ccd2mr198545445e9.28.1788776748835;
        Mon, 07 Sep 2026 03:25:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4e49:b0:49c:fa20:cc05 with SMTP id 5b1f17b1804b1-49cfa20ccd2mr198544945e9.28.1788776748301;
        Mon, 07 Sep 2026 03:25:48 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm407611205e9.5.2026.09.07.03.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:25:47 -0700 (PDT)
Date: Mon, 7 Sep 2026 06:25:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, Chris Mason <clm@fb.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	virtualization@lists.linux-foundation.org, ksummit@lists.linux.dev
Subject: Re: How is sashiko bot deciding whom to Cc?
Message-ID: <20260907062516-mutt-send-email-mst@kernel.org>
References: <20260907055646-mutt-send-email-mst@kernel.org>
 <ap6Nwf94aq2dk3WD@ninjato>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ap6Nwf94aq2dk3WD@ninjato>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qu9e-Oi-6hKi2Oca6vo5bNhXqcgP5FRYWIw9374k2uM_1788776749
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 12:11:17PM +0200, Wolfram Sang wrote:
> 
> > So it picked some mailing lists but not others, and some specific people.
> > 
> > Is that opt-in somehow? I'll be happy to get Cc'd on the auto-review email.
> 
> To get me CCed with Renesas specific topics I sent a PR to modify this
> file:
> 
> https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy.toml
> 

Got it, thanks! Sent a PR.

-- 
MST

