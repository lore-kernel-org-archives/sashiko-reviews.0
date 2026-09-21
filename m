Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC874A2615
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999505; cv=none; b=FSsgBp87B0baLyc+jRtukRA1N7SP856uVOPqsGEJJjcLxFjTQflfrX+gv/AvQ26AaTXAvYCCo9gH2Y1J5d92kcBZamz2tmeWVC7YlN48QjsX/5yrK79aRxe8LISRVYXHj9YDH2GaqOAx2r/vg5qwV/i9pk1sn3Y2NLo9Y8LxW5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999505; c=relaxed/simple;
	bh=2vJx7TXxxT0fRGwPZFAMsd+M7lzCJ1o7ZpGwKRgPhJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz1bojZb6F0gvpC9CO91jQ9atzyGf4LuROkLVsHSXDEis6Kw01hqjDbNCd/yI9kt4ZwjI2sRQQW4tXiWinhpX1vbsDWg1mCx0ttGMZHpusWxKYChfOpNpW9uH1OBmgIv6a5dsabBDf567yGGrjqBBEXBYoxFaijR0k8QGTY7vIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Piy66IFF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Piy66IFF"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso2383337a91.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 07:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789999503; x=1790604303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FVndDmsTO0EsvVcjBdIJcO67VaQ5MrgsL7GRVTGdqJY=;
        b=Piy66IFFXUKfAJej2Y1TA/Z7PclLAksXe29T3nrJ/cfLC3mt3BRLd4OE2M7UaE9Hrl
         PgpybTwKLH4ynAwsPtY8X/m8ZtNUQlxpXp2+wE4UbYvFkRYWHk4lO23QJIi9+9MIc70/
         gspVasvCjFMf3/1DZcy3KPoeyiuI7nr9nW5dY/kojQG/xjQ39o4Oi60fpwmA41c7HELa
         AAQSuSMhmsGQb+l6J0yDuvrVCIjno1CedvDoxUzmZUeRq1n4y60amsnhpjV22TOTnSMo
         FjfbSTwJUUOEQ1Q588jvOS07AFyDdHm9FTeB6YEqI1zN5+Qh8dO5F9ofcpbahWhG22s8
         MZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999503; x=1790604303;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVndDmsTO0EsvVcjBdIJcO67VaQ5MrgsL7GRVTGdqJY=;
        b=F/Wcspoe0aLhL2bq9t/kpG7CWXOvQebKdhVSYw0ySJ2zKoasCTgaAi/U6O3qpnIC6M
         Jba9z3LH0qJuqk6p0oorNdMk9JbAG0ts73UFpkxcp7zZilIX6fqTIZFCiiy+tDbl/TfE
         90JkL8UfrNJfGvxKu5lrnNJ0op6MdNKaQslmv2cxuHpOEftN5DQxfibffjgmPMY5tkFz
         wRCjjJrFcmcrXgMcltxeS24wmwXt7YlYc8XGFGYQXEh9qiJqBerH05mMNpyqq8d0sLbC
         CQizMeS2hFotatmN0ST+ULdwXX0yL4IrM97NwDNi+V2MLv7Ml9jeaNGYsHoxJS9AJBGy
         r7iw==
X-Gm-Message-State: AFuF++nvs9X1Hq+sWmuDCfafwpOxquQUZYjCvLoeX+Gs/b6mL196W6XT
	Ho8oZCUUoNvtCT6X5IBMN0/ne9SPd18h7VdWvKFPjOJ8T4gv2ZUv+9/y+zQfehLq
X-Gm-Gg: AYBFou3Dealj9+Js1U55vMQiKZpHj3aWeWBxXFYMFFTemTMJwOFN/Y96dTqZKYXXoDb
	lZG4BeOf2Exxdft/xvVi7CYbNbkvtChQKJknOtftspf3yhHnzSnAULL3Z9NJUb97mOqO/dOkzNe
	oyI9IVaMIOD4QXgfXQRQiChsbvDS6XmEU3QdiQIvo5iOuz7z311yJNaP3BPH9LTq2w6aAzzuVjj
	/6mGzkk4j0lyqSnionXoBvDty+w9DuZLrh7OTGq6W8Z7C0XkHBs0t75a8ghrowu79g/TC6oze8J
	KJsDnZGp6ITpxiLlnujh03x6e4Tj0KoFRMWupp/wtq5p/hKtRrTDARRmFGjUIDa3Ub9MdvF+Uf+
	PJO63l5tayBa/7IFzxg7iq+xuffubZc9bGM4fMzzUKBsiAcdXgoBaoQ1IiClBazBr37T307J0EX
	Dkyum8hgDGCncrSpZEVBXeD21yIJaeqaxFRMa7g9/vYE2fxgaZ4RtmOekqydXyi3anpNt1dmWML
	DnvewzXWgeZ
X-Received: by 2002:a17:90b:3b4b:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-39e54eaf13cmr19405297a91.13.1789999503258;
        Mon, 21 Sep 2026 07:05:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a063a4185fsm273006a91.3.2026.09.21.07.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:05:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 07:05:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: sashiko-reviews@lists.linux.dev
Cc: Muhammad Bilal <meatuni001@gmail.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: cpwd: serialize device access against
 cpwd_remove()
Message-ID: <52bfac35-5dd2-4b19-bc8c-c766c9a93119@roeck-us.net>
References: <20260919192301.272194-1-meatuni001@gmail.com>
 <20260919193320.0BB191F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919193320.0BB191F000FF@smtp.kernel.org>

On Sat, Sep 19, 2026 at 07:33:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] watchdog: cpwd: AB-BA deadlock between misc_mtx and cpwd_mutex
> --
> 
> commit b2d69e49e806eb6cb2c3610179ff17ccacb7cf1b
> Author: Muhammad Bilal <meatuni001@gmail.com>
> 
> watchdog: cpwd: serialize device access against cpwd_remove()
> 
> This commit adds synchronization using cpwd_mutex across device operations 
> and teardown. It guards cpwd_remove, cpwd_open, cpwd_ioctl, and cpwd_write 
> to prevent race conditions that could lead to use-after-free or NULL pointer 
> dereferences.
> 

I am not going to apply this patch.

If you want to do anything serious with this driver and you have the hardware
to test the code, please convert it to use the watchdog subsystem. Otherwise
please leave it alone.

Thanks,
Guenter
