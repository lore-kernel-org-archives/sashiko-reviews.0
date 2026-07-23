Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF84734C5
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826463; cv=none; b=NjYixQ5sGqgeY2jp0GRzRf2WAhllMaobMCAC+Ctu5tZNPn7hFmjOMLnLdq9Mr+dj+0ug1+7LD+2Vup/SJ38P+P8L+OfIHARgBT1XQIzhnY6KBXEtkTGaBrHUC/TL+vcUqOoPjAmfG9wTrTWGUb7UprYZC6mf+XGlwfPv76Pi8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826463; c=relaxed/simple;
	bh=9oiQXYSZ0TDKNvY/2UoP3cUFNw+jZM1SghiduaEEBnM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=Jc5fmW+Exx6ZwWB5FoKu2YYx37OXZZ6n5zuXw7Lw8l5/DRipbZWmoppTVAjPuL8UW80nHyzeQvLUDusS9HkYjN+TILSvHYHlWCa3PTTYM/ahL7KTk/a61Ec84Kle1LF0k4ekShuBBSHnHB+6PeA3x77U6lR2RW6xGJnansOiu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=hi7vXEQL; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="hi7vXEQL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso596085a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784826456; x=1785431256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9oiQXYSZ0TDKNvY/2UoP3cUFNw+jZM1SghiduaEEBnM=;
        b=hi7vXEQLvRrFEEakpfn0y+kNCKNTDTdiMtsl5LLVSFx1iwoZ70GBjT/y5phiThpn0F
         n5wwTFRA929NTzncluO44K4l4X9E9v8U/xVPsLRSNDsC2LGGIfn54s2mVRlLztnEOh/i
         eoUjeYNXJsCgd8aiKjdXqQj2MNv7fMfSTluPTrnrIm3A01ma+7no8QKVopQxyU+O2AM9
         Lzx1B3Xa4pbPgH/BvykSSu9HM7Y4WIRvPJhIMozBcAzWFvWnD9JcQMhJIjuyCxWtekwh
         4FG15yOJJ1RwBpYS05Z059x/D3WmCz7STLWHeyWxC1HtHzwqDF69UitspTf4Y06LTJbB
         vrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826456; x=1785431256;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oiQXYSZ0TDKNvY/2UoP3cUFNw+jZM1SghiduaEEBnM=;
        b=kuLNtW6GzNOb3roFFkXWImVYFge0M0NP/JwSbgyv28yyz847FGle+TZuzzEUD6enWY
         KoPF12E3eb7Ru8ydg3pHk9o27IjOuWHevYtrbujOH6/ItzhCxS0mOBSN2hW8U42RkuKl
         Fu/L1zn0sEDYuxOj2M2QT1w1AzZhQQejKy9jU+7/2CTwwhrVFPUoSqhuy02rT60VQFMM
         n2LN9jNk4vPBf4piPxDZY3TzIMCGRoN0Jiy1Z8tQkPrRpfQeBPAoL9tvj9W+UNID09ud
         LeQNQ65LsvJ3cPBTHxEc/ebjIARTxV1zbTxAwhLlleWb2BljUdl0/hP044k/aqXQz1oD
         nlAQ==
X-Gm-Message-State: AOJu0YyWSKksolMwkEG7ATxU/0Za11qLLpu59KBcPcWlYWO2Keccz8ff
	XTywPLaQVtBr7nXNdOOvLFFViOcodwBdJHbfZmZsywXm4eY9O2U2GUDEy5UUBDJtneHKxewAED9
	9tMa/9ZI=
X-Gm-Gg: AR+sD11REvePQ3HpUpT9sVgnGjYCiIUgxq9dV9/IB4a8SMXg0AhSt7kgCpPAz1tf8K6
	OsazSfftYIoO3GRqq6LUKE5VVY8Npuhmx6bjc2qFN7ML91iwvQjJzV/HyvlJKzdYb+6pk/6TKwr
	cxzxE6rFLCApzWHuWHhaUsOYm+bQPRwAoskkj5RU2a2kitXFg885p9+4RPvUqzqCc5k3BSlTiO5
	6LgDLDcCswBYF9gY01eTvMwHMP0nFZTbJHF8bCnSjtDQvC2KwNK22RN/FoKuAMjLh3VsZRyvNo4
	vNyOj65/3y0nccuqh5bExN91BZJgshJMTJpwZCFmzDD7jWC1MK0PtfQgidgJN94wpFsp09DsI6F
	zi2t+NEhMvSiEBSDFjv4vyKcBsZZs6aMalPj5T9akthkoCnHV/kY2dZNPjx0DICTLmziwgyvbqS
	UG+A==
X-Received: by 2002:a05:6a20:a126:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c44b006725mr4459401637.26.1784826456047;
        Thu, 23 Jul 2026 10:07:36 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm20460272eec.6.2026.07.23.10.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:07:35 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 10:07:34 -0700
Message-Id: <DK646A1WF1ZD.3TKHBS1F9IQB2@nexthop.ai>
Cc: <robh@kernel.org>, <saravanak@kernel.org>, <frowand.list@gmail.com>,
 <krzk@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/9] of: hold a reference on of_aliases during alias
 path resolution
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>
In-Reply-To: <20260723033554.022251F00A3A@smtp.kernel.org>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai> <20260722-nh-of-alias-overlay-v5-1-2abe2bb9cdbc@nexthop.ai> <20260723033554.022251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue Jul 22, 2026 at 8:35 PM PDT, sashiko-bot wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but is the description of the
> lock-free walk accurate?
>
> If a concurrent writer (e.g., overlay application) removes a property while
> for_each_property_of_node() is iterating over it, won't the reader's next
> access of pp->next follow the pointer into the deadprops list?

Right, the commit message misstates the mechanism.
__of_remove_property() repoints prop->next at the deadprops head, so
a racing walker can be diverted into deadprops and miss live
properties. What it cannot do is step into freed memory while it
holds the node reference: dead properties are only freed at node
release. So the conclusion stands (the walk is memory-safe without
the lock) but the failure mode is a stale view, the same as every
other lock-free property walk in the tree. I'll fix the wording in
the next revision.

> [Severity: High]
> This is a pre-existing issue, but does calling __of_find_node_by_full_path()
> while holding devtree_lock further down in this function risk a
> sleep-in-atomic bug?

Known, and tracked in the cover letter's open items. It affects every
OF iterator that puts nodes under devtree_lock and needs a series of
its own.

Thanks,
Abdurrahman
