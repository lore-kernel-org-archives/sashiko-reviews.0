Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628811B808
	for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 00:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171757; cv=none; b=Iu6ImpVQ69xbufeBOR1FEo4Iq2NLw5sDX/KCGxh8tdze1DxBxPwif3kX3pupeZxtgii8UWJ0Dy/eLmvhSKk1juVpSBMz57pXa/plV7GIxldUwUkWl9qmJ5+T5xMynH8n61QTuRvJg8N2DmGUIQtAHNEL4vHj7LUQFqsDOETMwMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171757; c=relaxed/simple;
	bh=QUPMqaO08oUcYGlK+QKcnzTJ2vhWDlM7cXLXYxsDZ4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4Ok1bvNZLHtfQBdxumPjm5cPnnruIBHVIum/yU6jL2EYMdItWm43s8LNS1s+m+lQNzqR5rYWFBP3sOsTNNVlljv1om8JuogppaTV/HZOA/qe5YUeMoiUwTIQEZiJrSVlsyphA6WRHuGJxejcBSYHAXRTqN7Ys9X6FYkJGwpY5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=NKy/A4jI; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="NKy/A4jI"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c7so8853185a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 17:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789171755; x=1789776555; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/J9+qt8jWu0CL9QlZjJtE4DsxuQMJWCwC+piAz+7Nb4=;
        b=NKy/A4jIROj37hTM+gLLBbngXkFuYQGh4aAEx2ugigdQ7m2n90xPhaNC+acNNG/QOc
         yR7KoA1F6+7x9mLFEaitKPNgYlHtVaS6dc+J3WZC7EtBrULoZbJGaXSFWKn1WtWPv+/4
         UytSYCkilx86zccOwqoAEqhet5D6ex6d8ONj+FPVvsvxKC96LuD0+/gjyLZmNykKKMsG
         YNFV2CI1ldS5xth9onyzDK+hjptczjTqg/D/sCtBRC7f84+dyyluYdoQRWjKGKw7+Xn5
         ys0FiUuYYnYQFL42kStNmNFUW7DptmqVE6Ck2UqRHLmiJ57f8NXpngncc4c3jtr7cFmy
         maAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171755; x=1789776555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/J9+qt8jWu0CL9QlZjJtE4DsxuQMJWCwC+piAz+7Nb4=;
        b=GyPknDgFxr43jHMhvzoBWfIcCxOL0DSO1Mi716nU60rljqX7/SU5UChoqBwdvNPcBT
         XWmoRXc6eFDXL3vLrDkHAkE/P/WZU+GK8MzYLsf9tGU3g0zE2PbbNk/NWzDhMcgL//J8
         X7GpT/ksAFr2QuyaK/fpBMUrEkxiF3XEECAgFI9s4oZXchOFHrzLLofzubNNUOy8TUJg
         cssJ/JL+laRNAiAy1W3wI0eCXF7PFMTTU8/VoJZcp2bSIF9JjzA3r0ETf13UmeT79UjL
         89NplnbVuE4eH1UT1kbzRRU++UeumvagIzSSW1qK8dh+5jtuSO732gYBnzrKY5xKHqxK
         NzMA==
X-Gm-Message-State: AFuF++mq8FlLOkApbHaW6T9vDaNXKxJVIOcgNFMYg97TE4/rxahrD6tc
	AvFtK6uAZtZbdFlaC80xcZFnwPqaWACBqOORqRq52bnt8Uoc/sPa0I1VHgoow4L2ssk=
X-Gm-Gg: AYBFou03NOmygnIslt7rIvcIPfENl9Rvr4sMMQWvz2DY95CVZpswldxFfcPE0n6/IP8
	irWKlMnWmBZXOINhpsc4FborYgPLxAJTm1rFVjaNpDCxvQqP71039mSQV3Rbzr7nt0XTbozTJqx
	2DHwnGNjHepnf6t117tqgdOhbxhK+Clcbx5lW8x6CxzrzEU2tu8PuLTWspSQ9brol6yglVWu4b9
	ZllKLFhLUry7HAgr0KNRAAdm+aP6LiEsHSpoqK3ji2gOjOcCZODepbkstz4FH8PMV1/tPVtJRcf
	JM29dN1+CIYQm4L/VKGWQdEHAZfZ74t4CPYpx7ReEzDkWwE1lUikkZwG3B3El3kk/KAm9CSFLXR
	A1ebq81d+6EHRVC5o9EzR2FGlPCHCimBrbF8uG6DANYryjmwuUwKKhU0MvMkhI146TpdkVMB7eo
	7ypIqCd0VjPwN10m+O2ZChoDPFt6m3/oyHnF7O5fywlN7oCPDP/JY1cmzsCz/HOqy5hnEiHH9Pd
	/FQXPHMaVCgcDfToLnL11T+Y1jiJtYvNSvcSkBPs/c/CJNQIIanQl8=
X-Received: by 2002:a05:620a:172a:b0:939:b43f:341e with SMTP id af79cd13be357-93a03671dd0mr109407485a.22.1789171755127;
        Fri, 11 Sep 2026 17:09:15 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e803dc90sm365356585a.17.2026.09.11.17.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:09:14 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:09:13 -0400
From: Gregory Price <gourry@gourry.net>
To: Anisa Su <anisa.su887@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [RESEND PATCH v13 6/8] cxl/mem: Configure dynamic capacity
 interrupts
Message-ID: <aqSX3OadID0REQps@gourry-fedora-PF4VCD3F>
References: <20260908102124.2231730-2-anisa.su@samsung.com>
 <20260908102124.2231730-8-anisa.su@samsung.com>
 <20260908104327.DF5E61F00A3A@smtp.kernel.org>
 <aqRuYaUt9qAvPA3W@cxlqual>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqRuYaUt9qAvPA3W@cxlqual>

On Sat, Sep 12, 2026 at 06:10:57AM +0900, Anisa Su wrote:
> On Tue, Sep 08, 2026 at 10:43:27AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > 
> > Pre-existing issues:
> > - [High] If a CXL device is surprise-removed or a fatal PCIe error occurs, `cxl_event_thread` enters an infinite loop, pegging the CPU at 100% and deadlocking device removal.
> > --
> Surpise removal is unsupported. Jonathan mentioned the same on a similar
> thread: 
> https://lore.kernel.org/linux-cxl/aqLZP3ORYzCLfSgR@acer-nitro-anv15-41/T/#m8e12567a42b07fae8aa307406e6e017fe24ad832

This has been my favorite sashiko response so far

"If memory is surprised-removed, the system deadlocks!"

lol.

(your series is great, sorry i haven't gotten around to reviewing it
properly, i appreciate the doc updates very much)

~Gregory
