Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E3B3A6F04
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064522; cv=none; b=J/6JeYd63oY1dIl6JKzJuDVNuWBmglWRgLAVg088kGTDiaRjL+tgQz57mUKEpulgBe9PSa59ufiDqwgZw73jfhOmlQiAgoKapLqeMaPIi+kF3Dw/35nzmxqiGpynlZOlH/lnd+Pm3CWe+hkLjVV1xU7mcHbe5DunxLO1V/69e4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064522; c=relaxed/simple;
	bh=7Ycn469SFWFeO5s2hhsreUDiy/3RnWxqNOUX56/cLd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iOYZa0uzZ11+ZbNmdaN9UOOuIyYWDORqJxOYp+TnLAsTboPpGsZmhreaZfWIhw7i61c35jNtOUrVNgh84j7bCGTdC2MR47w1byHDw7vdVWeoLWkYyGHsZLsLm9cH3LR+3TFQ0mH83qz/iwNo94vkoYFw97b0VsM3too7bbU8/UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L5MR4mgF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L5MR4mgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787064518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqratTSFO85K0UfEW/nA8PLglWUW5y7UwI0MM36KLxg=;
	b=L5MR4mgFXS7ljsIReYV9CpjGcd5bnkqmso6mS9lYNtrujPv522B5DpUcEAsHcuj73ePq2r
	BrSZpF+ARMns/L3oL3ZFMiGM8mKiR/nnJZH/3p+V5Gwp3iQpcJrM1lk3ZQGNPCt72stIkI
	TP+sXzmF9Z/Wr509IilpC8gAXOV9xJE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-IUv_sr4SM1WK20XI1oHfhw-1; Tue, 18 Aug 2026 10:48:34 -0400
X-MC-Unique: IUv_sr4SM1WK20XI1oHfhw-1
X-Mimecast-MFC-AGG-ID: IUv_sr4SM1WK20XI1oHfhw_1787064514
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d33c89a29so60946151cf.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 07:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787064514; x=1787669314;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqratTSFO85K0UfEW/nA8PLglWUW5y7UwI0MM36KLxg=;
        b=jidLgAENHznqeobjn9vmpDJU1UOpCCBbMLDBbuPIW8FVn1YBRTIFdB+loutNSzqcAl
         O18Bd6lNZWoE1SkmgQsaj/7NhYXDCwho5qMK/fY4/wNGyO2RagV1YVleOLBr+PlZzmvm
         lERNDWBWi9ex8D/Qm4IcNrK9uOyo3FgoxfyK8L0btPoxEGCekBnBvNs+FUflGIBddDni
         WT+N9myWAHCfYc2FjwU8eXX6ZOwz+T1I16JXOOrfORAS6P/h5d1qKRSYv8qdoqQK8NUg
         jU/I0hhrGplhwA3E0KZXY3HBHN4Hzcupnzsf6YepWfUjOExc8YK+PgCsZUF4LYzttPTz
         scuA==
X-Forwarded-Encrypted: i=1; AHgh+RoyXP4SEKj65Sl6cSuvhqZVmPmmR2Huxsc8IT3mAXbzBxERljDHo7tJ67mSki7ELbClw6+odClvLCwqrPr0LPs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdyx2lq/0ZWtGo2QDJHeQP+iFs/QF5v7NIXNItpvfV2g6SNvLD
	NBQ83FpKaD0ZLr7BOo3kWpUgwsy1dHCQAa83BFGb/nAxJffj3atlkaWWKxCC9C+eVZB+ZRtL8SL
	eMpEF6g2J3Di9qUvvQHlmTBjAoP64b7t6lfoBu8DjQN7PRvJ++XXWCyfyjONjKnWxFm0h0A==
X-Gm-Gg: AR+sD12F9U+xXuy62dpkE2ygbmv9lrS3HqnNprLzsNOSxkNGIGvwwGAKk+0vPRkyLy3
	M4AUj4yVCd25Hao67NPbt8glN3cylP3oXoKclY6FyzbUlIvVRwDxPBq1LZU8p2KqEVixgTT7x8j
	xbasQxlGwNcX30DLGimhqG04aCeGrK8sYXDQYnGW5HyrGPbF7fU7TmqLGSVWGgkGFcy6Xtqbxzs
	3dlghDlMBv2s1kQjs+1UrLXXKJ2kH19Dpd1DBEpyocS+9urqxJGtjJ/bzRzmwmNnxN3HK7vovj7
	//QdmuS0+wvj8FQHWnYZw2zjfv0IXXfHugZ0gUWZgacfSxwcD02U3WgPoUefH2YlY0OxXcowa3V
	3B2FlkjnN5tI1Rmw05u7L+wJQtgsuW5Pp+Fo=
X-Received: by 2002:a05:622a:118f:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52dbd769343mr79745161cf.38.1787064514168;
        Tue, 18 Aug 2026 07:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52dbd769343mr79744431cf.38.1787064513566;
        Tue, 18 Aug 2026 07:48:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db6127e2dsm41922251cf.9.2026.08.18.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:48:32 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:48:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	Brian Masney <bmasney+clk@redhat.com>, Peng Fan <peng.fan@nxp.com>,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Message-ID: <aoRwv93owSaasnC5@redhat.com>
References: <20260612-clk-v10-v10-6-eb92484eda38@nxp.com>
 <20260612085812.AA15D1F000E9@smtp.kernel.org>
 <178672426822.5897.11563790103554525148@lazor>
 <aoLqSA3XOMJnJL4o@shlinux89>
 <178698381923.5030.9178300925075210422@lazor>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <178698381923.5030.9178300925075210422@lazor>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NvYtjSkE224PLiF6OKcMmUVvadjgNkcJ32rjwS7euMM_1787064514
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2026 at 09:23:39AM -0700, Stephen Boyd wrote:
> Quoting Peng Fan (2026-08-17 04:02:32)
> > Hi Stephen,
> > 
> > On Fri, Aug 14, 2026 at 09:17:48AM -0700, Stephen Boyd wrote:
> > >+Brian and Peng
> > >
> > >It doesn't link for allmodconfig build
> > 
> > My bad.
> > 
> > I just posted v11 to address the allmodconfig build issue, very minor changes:
> > -obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
> > +scmi-clk-y                             := clk-scmi.o clk-scmi-oem.o
> > +obj-$(CONFIG_COMMON_CLK_SCMI)           += scmi-clk.o
> > 
> 
> Ok. Brian already picked this up in a PR that he sent me so I'll squash
> this in.

Thanks. Sorry for not catching this. I only did an aarch64 allmodconfig
build before I sent you that pull. I see this happened on x86_64
allmodconfig.

Brian

