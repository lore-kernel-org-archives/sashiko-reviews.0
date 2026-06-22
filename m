Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F529DB86
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 23:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782169463; cv=none; b=Nos63na2Ttujr6SlSLxQfoTNo+8sI95GCNev8aNeuLju45a5xet871Ft2DajbL4QWWrEY0m4OJ28IZW/W1JtROT/8Wq6AWL9Z0x0qYNPbja0i+QQ5QbKRub3xmCinpma+WnlrTkEVjYpQBkuZOWlbotieIeVyTwSXEYkHXOc26w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782169463; c=relaxed/simple;
	bh=Jmd4nVp4kfTrvTVEijkTHHv51r48Mo7H+ZvtGBWl2O0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p8RX+kqrLDnS+ANtHH2VLTbxJQKnAMAf+iJLy2g9IzyGw7FRXG/qHdoR63tXr9mhD21NutrQ/z659sZJ1+m5IDlUAKPrx35uxFPI+EWq3n0OmvRuMg/JuhcjOH921glnS1IQKpF3xd0aINAWJRs6UDoKbr6p76BFdJmlrJ9fJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YunY5VEH; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YunY5VEH"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c7c7fdca0cso1333365ad.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 16:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782169461; x=1782774261; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DbguCPrep9cl5dKCDjv+7UBnuf7b6qWOrC/gr5Xvvj8=;
        b=YunY5VEHeKmzTvthFDv8hv9uzNRb34x+yLQA+xxWL5Lb9o5ZceRQOFDHgT5R625R3e
         42I1GZs/CD6pJrNco6gNRmiIxiVHDN2RakBpXKFc6mdDa+olBVuS1Qkdct6aKdxZ3LLz
         /chNIEdIJKJUf9butYBTDU8GyMyjXsEdHATWlgQuLuVwjFCh9jAevTR7MxMSDr6uJJwG
         bPQpubdZaz3zOIPGJsit5gib5cL4UyYEXW9Q1Xb+PJRsd3S3/gtmmXFqyiEuwYl7rlQ7
         0YLFCpJeBN6nVm6aEd8eD23huBQ1bPZAoXKbSRNIFJjIDkcruvRyGCAPkI6cV4nvkiIx
         RfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782169461; x=1782774261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbguCPrep9cl5dKCDjv+7UBnuf7b6qWOrC/gr5Xvvj8=;
        b=DtkvuCi+3XFTIidL2XtZUa0QjsO6ejeJKGgGo350y8rTWI7QKLQH9R+pIOWJZ8/0fP
         yF1QRjoIJ3WUxBj6szVZgTGLlY60Rz1cWkMTNIuBJqThtcCDKu9SgROBFw47VUHPgPng
         VlntrIxn/okl8daYCgmyicHOnulJrTMsMKpwhXNf5d+/b7YBDQkpK2Im8YNW0NOTjWWk
         O+qAXH+C6e5G8eRfwy/INR9j5agD2JhcwhTN2S9Imot1H7O+leC1OkmKTAvNyLhsh54s
         RReaqL/midX4KKCjSlQQgXPqb0EgEBQBWn/8Gi1Ie4vzT6lYxiWftlzCU0hLHSUnQ68h
         aWqw==
X-Gm-Message-State: AOJu0Yz74Z/o8BxpsBPW+cI6wrETIdwK+mudrrW4HMzqe+9v603Rsg3G
	0dXcBLQPYziyexr7JcJkvau8Zt/RLAGLzuDuQ66Eb6RhLlwhWBaZc+Wru0y2/5GMkrdAYugf8zt
	18pLI1g==
X-Received: from plpm7.prod.google.com ([2002:a17:903:3de7:b0:2c6:9f4f:f3b8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:8cd:b0:2b4:656b:aeb0
 with SMTP id d9443c01a7336-2c718f67cfbmr186053355ad.35.1782169460861; Mon, 22
 Jun 2026 16:04:20 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:04:20 -0700
In-Reply-To: <DJFI4P57YE9X.20DPMTK9LL7LW@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260622-alloc-trylock-v2-0-31f31367d420@google.com>
 <20260622-alloc-trylock-v2-6-31f31367d420@google.com> <20260622101056.4120C1F000E9@smtp.kernel.org>
 <DJFI4P57YE9X.20DPMTK9LL7LW@linux.dev>
Message-ID: <ajm_dEqauYLBi-7T@google.com>
Subject: Re: [PATCH v2 06/13] KVM: VMX: Use higher-level allocator
From: Sean Christopherson <seanjc@google.com>
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Brendan Jackman <jackmanb@google.com>, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 22, 2026, Brendan Jackman wrote:
> On Mon Jun 22, 2026 at 10:10 AM UTC, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The commit message incorrectly states that `__alloc_pages_node()` allows passing `NUMA_NO_NODE`, while the opposite is true.
> > --
> >
> > commit 7bd439c242125db27305b61b14c9972fb028282a
> > Author: Brendan Jackman <jackmanb@google.com>
> >
> > KVM: VMX: Use higher-level allocator

While you're dealing with nits, can you massage the shortlog to something like:

  KVM: VMX: Use no-underscores API when allocating pages for a specific NUMA node

"Use higher-level allocator" is extremely vague, and arguably misleading because
the "allocator" being used isn't changing.  Which is kinda the point: *nothing*
is changing in practice.
