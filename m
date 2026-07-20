Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2803D23D281
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 05:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784524689; cv=none; b=PKDjvnjVzgSuGWKLpc2RZQikPDfejksQ6iR1nzkiOqzMcsircJyzpCBDT+3o4vXooYlMQdBAFl1/FBUY/FjXZ/u1ELyUq6jC10jDqrKCdvTh/vv9q2GS8mjLakue+IQZWxUUL0Tt21TfzFOGw05T+Op9RrLP61WK9qTb+/hbwSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784524689; c=relaxed/simple;
	bh=eZxU94BUfQs1S7dhMiygcjoahDydNmQ3jqhq/dfwLLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmdC9lPUqsGKKGETO0LqHgG2t9WpZ866cURqPxxHSxYQU1nfbnzlv+44sgFvgaDXfNo0malHPp1ErPx7sS7HKp69tmxrQHEADqLGCEp/e6B4tVY3o2GbgLQ0jzoN46daAGEthc7fKw5oAS5ReY5GpEMsALvQ2Nb6m5sjmfZC7BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmG2kEWG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmG2kEWG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso5707133a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 22:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784524687; x=1785129487; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JGTPADoCRFsZWEQfK8/mF619wVil3KY9yAYms2+ACxs=;
        b=ZmG2kEWGk4yU6hsLwVMzOvpiqzy8VAFfGvrlwUOY0QjoVEeKTDDQnM8SDP05rYzNvo
         hQaZ969Nq47C5BNFrT2EzdQvNPeINIHdaVI9kTr+LF3rFzzOPyLrqrhQfXfMj/mYnBC3
         cvvAljgxHoSjN3i0eZnoVwztyCQGG51jTaju6URFBFaOBX35ugle93V7rnsVe/1rAY62
         XQOBpLlFow4o5CG3hm8t9JAkil2TehixKiWQQnJ1DZI8Uy85F6CSw+U0Wc1ciLPK3MkR
         cCWPKTh97l6eMj0dUfK68mtbqvC7bxNNOYSQv34bHOW6S8BuJxXGxCPqEKThmOasc6LU
         s7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784524687; x=1785129487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGTPADoCRFsZWEQfK8/mF619wVil3KY9yAYms2+ACxs=;
        b=EFGw+uAWaLUVq4V5Os+GfBU0Gg/B2CziDzFEOZ5uAohMzcCzfcAYw/9jJxTg41OtVS
         TOpfhw0Lv7KSrNuaxVWKIcs8j5Qh7a1uUEDZsTs/NDc0eOf70vmo2fl2UlqQrrcsiSoE
         B2ZSRbdkhoLDLn4cgDrJMv/I+KOZYyKStOEPFMBUryP3BqS5C5h0dYzurAm7jKHwV3Za
         3D16qVrOjgog+f2UY/QobCMjmsGkl9cmFKTFgcbMTtuE5V3SZ9pfTEA7WyruaMicvj18
         BI/q7PQ6FCcPwybt6DmhYLYDu6MAnG3iTSajXNm4u2D5f3fJ45xp6zFpUWSQeel1Pu8c
         SxFg==
X-Gm-Message-State: AOJu0Yw9SBeAIeHLYwSYR3TfjjrhyUUWSEVsrR3dRaXQLg0S5BGDIJDy
	9smozhqCyxTvu6GKApnVk5GrK9/fC2+5dDpFRGxYXmHc6kXkKGyEumG6E+C4BA==
X-Gm-Gg: AfdE7cmvZ7J6T0tYFK7AHpl8tjo1P5Bv+EGfXtRGPiuM30J2uhTn18u4uE0sUhHcNKS
	gy3mcsat2ayoRoyp6PT9GvYGoB7efnj82KGcXPvG7tRVWr3QjwsSDwHLIpsvd/sazVMnDovHUDm
	pgYPGczVSu+1LH41XjtPYDA+vjbHKKYj1nIP/zZpOqNSjT1Wif7ShV8I3pUC/5O0DYNrnb9+QIY
	qgUJnXvfDEArgVFJH4k23QWC2Brz3ZirP5FV/URudu3wU8ck4r8UHNQSirmvGugqoVV1/KQwEP+
	MOn3/opDdTe4+FqcxhkJp/5oKISZJthHypl4LIKCLM6HalwuoxKuqmVeRWcoLJboizV8ql7bqBb
	ncPmOgnexUdaldDedV2fn14PuJhfWU+xpEyIPt/kwDU7uSAfBctdWCa3yjLJTG6Ffy01GzEbJcG
	+UOF2OsCz5OLRadQZwScF4enWBIp+gWYMgZ8/jmMlenECJQa7Wa9gloA==
X-Received: by 2002:a05:6a21:485:b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3c3ad8b2dc2mr13455022637.35.1784524687434;
        Sun, 19 Jul 2026 22:18:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:345f:e51b:3d0c:4546])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcd9sm32727251eec.3.2026.07.19.22.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:18:06 -0700 (PDT)
Date: Sun, 19 Jul 2026 22:18:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Linmao Li <lilinmao@kylinos.cn>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: byd - synchronize timer deletion before freeing
 private data
Message-ID: <al2hgrtDg3uSgbVR@google.com>
References: <20260720033030.1580891-1-lilinmao@kylinos.cn>
 <20260720034855.07D8C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720034855.07D8C1F000E9@smtp.kernel.org>

On Mon, Jul 20, 2026 at 03:48:54AM +0000, sashiko-bot@kernel.org wrote:
> 
> Should this use timer_shutdown_sync() instead to permanently prevent the timer
> from being re-armed during teardown?

This is a good suggestion.

> 
> >  		kfree(psmouse->private);
> >  		psmouse->private = NULL;
> 
> [Severity: High]
> This is a pre-existing issue, but is it possible for an interrupt to trigger
> byd_process_byte() concurrently with or immediately after freeing this memory?

This has to be solved in psmouse core, I'll take a look.

Thanks.

-- 
Dmitry
