Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2D536F8FF
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593455; cv=none; b=dFSMEPW6MjhNaKlnDuTn5QnNoNoAWyfH1k3vNJcW+c144lHGrPvsfOa15s8wCPBIVoXjy2TdbxFT+EI2a+8EEaY/7zTU/nJxfMGdVe01utJQ248oX+fCSIluYAiygH+bGgzStp6Y7gvefrLifsHdJqGBUGqbdlK9GKhnR5uax/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593455; c=relaxed/simple;
	bh=cnQDhI3rPLRAlQ3SMyaVGYpY+5KTbMQDpuXpfVrgGhA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NWeux3cWDecoPqleeAKrMf/ueZNPdA8wkS4m+l7WwD1/zX8r7g/pKfR89dNi9/ec7hgSUl8B2rpSVU1uATZx345CNOGsD4grsCQMAjinPTevlqNXDmoYKTU3qk9GlyfCHU5Pl4ISq4GgEtS12JY30wP7SoqCiX7iLWk9biX+cws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VsyR1wsQ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VsyR1wsQ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so1321224a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780593454; x=1781198254; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QiE08N0otE8gZoBNOAFs9Ba6fLHtJ9Xhjyt4xcKDCXo=;
        b=VsyR1wsQPeVnBTS45PqebGL+jcYwpbjNCAt1wPl9393id/71CuEYDB5qhEoWiLdoN1
         FL6FQ8PwD+/d8Un8MrTfrVfDeOfLnnYZh8quQUfBKTDsiRQuQl7hyFR4BLcLywpp/JGV
         46GnJrVdAPFawoEp1c0df+XcQsuZ9OodJuSNVzqckgESU/nNdPP0X088TLObni9wVJDp
         NFdSisPZ6BzWQtWBI4ciaQXjfJ0m2+NXlsFKYBrYKIb8k9EoHvC8pEbnWE9QJJ/0jL/1
         MqdZFVLmamFxyjeizNnVKdWhAt+7d/D0agCP4OJl7jfwgAmSZbwUXRyk0qXY/NJxrY76
         Yngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780593454; x=1781198254;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QiE08N0otE8gZoBNOAFs9Ba6fLHtJ9Xhjyt4xcKDCXo=;
        b=LjRR/ZPNZWyQPsoGfr8kIcK4I0Lu+GgQ55EaQnWaiLlB+WrkaPab1Omez8V7bFGQzL
         67Krx5FjA4krWjXYUFDC/iwYsWjRuDwYo/vsKXeEhdVIrA6v0e3cWDTpc9vP96SL/eM6
         +yPV9onDDZAG2o3Q7JBRmvLm44Y/+GzkhVt9Di2NfLqk56JwxJGuJOQuwbhb9XWZK5Rx
         O7RJebOuWZetJgd9agikMCH2txIXpVFobMI3AV7syWZzQFHG0xeHVsKyx3nlnzXBI+iY
         5yjQn/OfeRowC76B0j52d9vpNNihMzCtTbJWLrKDF6rfzJFSKWccBUR0M/xXx/wXoHat
         XKhw==
X-Gm-Message-State: AOJu0YyEg7beqftsd3o6TFiuVQ2UNBkXaex79V2OayR+zNeJFOrllHig
	cAlQ4bYahLhlAROTDMbeE8N9h4/wOvFVj27Sy32oEh7IGg427AfF7o16hWj/2ALbdw6y/sYp88G
	Qc6fhNBPWmWwEWdn6oMP0edRs/pEAUeVMD9C1UScHTf85kbTqNzNgbO8qgviPlfsu/R/dc319mo
	GOlm503tWpNA4SvN607KBMYD1g+A1TgydxKXR+uKo39nCrQ3it
X-Received: from pjbqi11.prod.google.com ([2002:a17:90b:274b:b0:368:1f77:ffae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2742:b0:36b:bec8:94cf
 with SMTP id 98e67ed59e1d1-36e2f9a2497mr8748830a91.9.1780593453567; Thu, 04
 Jun 2026 10:17:33 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:17:32 -0700
In-Reply-To: <20260604020939.3D12C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604020143.748245-10-jrhilke@google.com> <20260604020939.3D12C1F00893@smtp.kernel.org>
Message-ID: <aiGzLEMLMR06kVZY@google.com>
Subject: Re: [PATCH v5 09/21] KVM: selftests: Add helpers to print proc IRQ
 affinity for IRQ test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 04, 2026, sashiko-bot@kernel.org wrote:
> > +static void print_proc_irq_file(unsigned int irq, const char *file)
> > +{
> > +	char path[PATH_MAX];
> > +	char buf[256];
> 
> [Severity: Medium]
> Will fgets() silently truncate the smp_affinity masks on large systems when
> reading into this buffer?
> 
> CPU affinity masks are formatted as comma-separated 32-bit hex words. A
> 256-byte buffer limits the output to roughly 910 CPUs. 
> 
> Because masks are printed from highest index to lowest, truncation would
> drop the affinity data for lower CPU indices, which are typically where 
> IRQs are pinned.
> 
> > +	FILE *fp;
> > +
> > +	snprintf(path, sizeof(path), "/proc/irq/%u/%s", irq, file);
> > +	fp = fopen(path, "r");
> > +	if (!fp) {
> > +		printf("  Failed to open %s\n", path);
> 
> [Severity: Medium]
> Does this bypass the selftest logging framework?
> 
> KVM selftests typically use pr_info() from test_util.h to allow standard
> informational output to be suppressed when QUIET is defined. Using printf()
> directly forces unconditional output and can cause log spam in CI
> environments.
> 
> > +		return;
> > +	}
> > +
> > +	if (fgets(buf, sizeof(buf), fp)) {
> > +		buf[strcspn(buf, "\n")] = 0;
> > +		printf("  %s: %s\n", path, buf);
> 
> [Severity: Medium]
> Should this also be updated to use pr_info() instead of printf() to respect
> the QUIET mode flag?

I think for the initial landing, it makes sense to skip this and the usage in
irq_test.  Printing the affinity information definitely qualifies as "nice to
have", i.e. it can wait.
