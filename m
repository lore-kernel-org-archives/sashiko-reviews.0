Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BAA42C504
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015189; cv=none; b=MoG+yY9nnH8B24zb18ikW84cvuUo0oQRebDRh5R2Ty5UiTLyJxFMO30HTl5d6GGB5UczDs5WI2Dhz1KN8PlLm9huuftwVu06+51ZK5JUrd7LGoD/6OO+wkfLIZ3MbRMdsmalslUlWbpJhLJ+NV3X9BzRBTexgY++ESwRZnSxqg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015189; c=relaxed/simple;
	bh=CnHpUUI7pdIhBuSRzNEeZEWMMDj4WVealHeIlZkbQAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QK/p8jDwENjnL7dyrNmd7A84Cp4SKosOPLkZv/goRmFOTVZbD2iVs9snq/aU2GfVlZkBIKEXW+boy7dVm+QT3i0PfAZ1Q2/rI7Yv15+K6n9hH4jjcn2FcYsGQfLqWMd/W5XlT3Xr3I63/sZwYrCYzd6gep6nfN6r2FbbnzphoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xk0++nKi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xk0++nKi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fde295992so703115f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786015184; x=1786619984; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akASYRjtF6BO4x5KD3iTDLHDlzLsjhfQ3KKqFIPbzo4=;
        b=Xk0++nKiK9KXeeBLU3Rg1Z8Vl9GwQAAlbLHl8jdmEL+kzGUQ3ES7Tp0f85BYPLai9Z
         tHX90UpRORfx9j5Oi/2/jXaMzbZdcmbxpI2aI+9Fy16WiHrqrzorCAQdIfvYKSvriKcm
         yLy5l3xnkyAgJu5fEx43PKaJr31VO3ueQUfoigwJNatzDhXTN5OmagHTnDYMZOZcyKYE
         +MxgQ8BIDwzEgNVLHJXM6Uf59wjJaicAYOjlBlnMMGCj6YpR9EZqzue+40vjlS9XHOxc
         EAxgenB9dLABXVdHNWFMvMGvLHFMjhCjcxHmM0E+Xs+DWe2y8iWltMQmfq67BzckNmv6
         wSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015184; x=1786619984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akASYRjtF6BO4x5KD3iTDLHDlzLsjhfQ3KKqFIPbzo4=;
        b=nXzS2LH2OWRzG6eZvQV5M6ZonjKgekaqk5eP0e9A2H8AoaZ9sC6oMTdC3Zvkp2QvaD
         k0wPSTZ+qCUp0ijDVObe0nTz6yoH0QysorYHwDpucWCAfBRM94eHYxDALgg4KfKXtEP9
         P3/Zoh7JSWnXgnuTNeRtvhAkzntukIMvVtM4rYUA9zPQiIz+XfzPgloVG1XrLfy4Qu+G
         Cx7t2rHvNPZW/crY/odpXBd3cRag78+/caIDcKUdu97RCh1w+E7BEu7lfW78L8L0/OIr
         eFHpHLtp4caWS9TU+NBL6p6Ma2l9Z8YsfTt69hCn025MEUMgtrQufkpz/Pds+8+53qtA
         ITuA==
X-Gm-Message-State: AOJu0Yx27JfOrVLC56w7po8kWo5REDaBYCdpDZp8tCip7wq8KQUfqf9N
	tjVjAcehTulMzrH7/mqkTcElcRk5CgBOZL5IN8sNXUyzvW6PV5t1FCl2VDqzCV5fKrXpjRWcdrs
	2tKHg8VI=
X-Gm-Gg: AR+sD12f9x3dj2Lw/M5bi+ghifeSHeubGsDT8r7CDX7+MtZ6mOVVCZc+U+HyzSIoGGP
	cQNcWJceJ/qT4t1pkYonWz1Os69ay7dxPfXzPlhxt2i4lm/1Gwu4wrqa/5F8UMk9E8Si4WBA7J5
	52d4jh6vtdXRaNJADKIlYxrTvWn1kbpov/zQ/x5E763otx/kfTAUQTzIteSSFD/dvpfwP0YHBrY
	H38l2ZU5aZmrP6pClzjcHUXbHvuAYHzUAaiYKX2ezdqhSRgE79sXH6VyclIOmCBSvxINLVWtWk7
	Rpzl3QP9GtXe/g5BH4a2zmHDOtjkpSsyLNhPo+nE4bbN+XHhRxZAdzfrFzuq4Hx06uMIX7hxDXX
	uv4ZfRi9SGwe7F249v/FGLOsyLQJ6ZJzm8wN/7kpqW+dHJ/bxhNcGU4qqhbklLlpIGZA3qil2Wb
	tI++mMusGZO/ph1mDHvsiLwLV4wH/vDbhROK6GCmQpjOf2RsFxbfp5T7L0X17Dg3u9cYKnJ4eoK
	mWz7V4+V/TZqCO7YjFmqwbqjg==
X-Received: by 2002:a05:6000:4007:b0:47f:ec53:1d2d with SMTP id ffacd0b85a97d-47ff4cc3307mr8830084f8f.7.1786015179457;
        Thu, 06 Aug 2026 04:19:39 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b3279dsm4987381f8f.36.2026.08.06.04.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 04:19:39 -0700 (PDT)
Message-ID: <b8371d0a-b5f5-4091-8bcc-c6d337452f5c@suse.com>
Date: Thu, 6 Aug 2026 13:19:38 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] module/dups: Inform duplicate requests about the
 result directly
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org
References: <20260806-module-stats-rcu-v3-0-2b0331106f00@suse.com>
 <20260806-module-stats-rcu-v3-1-2b0331106f00@suse.com>
 <20260806092534.4B8E41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260806092534.4B8E41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/26 11:25 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Re-arming `delete_work` while it is currently executing leads to a Use-After-Free and timer corruption.
> - [High] Waiters sleep in `wait_for_completion_state()` without holding a reference to `kmod_req`, allowing `delete_work` to free the structure out from under them.

The series fixes these use-after-free problems in patch 2.
