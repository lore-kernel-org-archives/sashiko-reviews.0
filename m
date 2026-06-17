Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8138480357
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709655; cv=none; b=ttgrJUl6Xpt7G89DiA8HA5HsbFijiHfm3EO87Lwy6JIam08gUcKto1P4NHupcg6UA19ClVmIsRmJtAU0szIZ+dQTI9qDCr8dnyRRJiJsW38WpdZXPnFSu1DnNY3I3M2SMY/KNM7J2jHyjF9QfwNwZ9CcWFstK/wNvb37/TFdTyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709655; c=relaxed/simple;
	bh=nRcES0nMkLOy/vc/9pqn5mJSKCcle9ew3LfE7oSlcG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AjZ1CQusAPboieIEKvdL5G3PyEQAK169mc8qa0QGsfTIE26EJNenQ2dlaY6bakJ5IU3nWPBcEh4H/DDXLH+Wy3jvJxr5JVAfHV5g8LLvU0qTSy5FmlyC/CLH7sVn+cM0VEmO8wFQQVtZ1pyadVbKvGUHRNSDIPrSNO0afM4mEBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=YI1gImnc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="YI1gImnc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so9948979a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 08:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1781709648; x=1782314448; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z182pk1fhhv1QTpxWDEtMipQ5yYjGFFBW3oThiUmi/8=;
        b=YI1gImncEjMou9hFR3xGtLcElfyMMoIzJoASpha1a+CG50ty3EOpJQDy7nV1pjN0zC
         gQhIK49Gm8NeksChxl1kLw8rwSe4xVLPFkmSszm/fu0dU2FLRbb9yFxbuYn/RT1YEvfT
         olmqkIogobAFrYZccGtMKoK+bX8lSPYfM78zwQhvWrcL1pCrGIBeRZmWYQIgUNiyvB8C
         GHJAvIZrP3a0LjBqyQLDpGPzEZUc0Q9akG1Yo5ldTtazzd/OFPp1oq8zc5Kpj8xk5vls
         hGgypevw1xf5WcVrwTI3+kjMZzVPndUgvwCWROjhg+jJzmqVcXv/auoSEt+lAo+RSBCx
         Bt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709648; x=1782314448;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z182pk1fhhv1QTpxWDEtMipQ5yYjGFFBW3oThiUmi/8=;
        b=fXZ06W/A8jefH7V+XZMCV4J60EAVWsBbhtlw9D8Ds+B6aYKEGvHteqbHHaNSdwajG5
         NVBSBY+pIQxiRfa1hKr96myOD+dWS4vUBSdXd9ZXs1zIw2WXo4aetEvdcG6Iu/MZnop4
         XEWBavbqhB07T1SUzxs69BZhO6eSR7p5769mnNCOIRkwaUUISOujfTXLBoycWmoCYYMn
         pPRNSLh/6bKkcSG9s81+Clq5WsQOXtF058TlPqNIfJtrb1FZXgGZQGlZNf+03Cg51xqI
         I+fOehRBPmPNrXL1yuEQFXB/VQXG0hkVmrNDI78ziIPmU9cPqeb3qvuh+vwRa/e53goM
         ad5Q==
X-Gm-Message-State: AOJu0Yx9Csavq5H/iaw+JHc/RzOMxGmkLodqD/JxTl17uZZ2/bSmi8IQ
	CdFY3F3a+u7bKzk8VIgZtofTRSO+L7krAHzIvM3WcqEiZ14vbByQahIS3IctVUeGX/WgbGtDLdl
	8gKbe
X-Gm-Gg: AfdE7ckThbAV4OnHy/STZHH08gdTD/rD/IM45aUkiR13g/B0Cox0rJKvEViLUe6mCoG
	dDF+/kU4DGqVGO1E9dBWsaiC9Ca+/YfvJudxmPjAWbVVn2qLpCxux172tIUU4Pi/SLLoh7ap+cW
	etbyFV8vzibO1ipFH8EsCTSOGhll2i3H9I5OfApe3QiaC1rm8/h3M79wiTEs6GrfwVAfwPQiwAk
	/rZSLubkFwiIyMIBVf5MFjP+6M9+V0N4yWciiuN6fEOd0YJ8VE1xlyo3Rj0qNHTz3T3QsZ+X9mv
	Q7ROS/Q5GNXWUume9mNtr0aePY+EQVmiJzcrkabLyqcOo0iQM1wcLwQbN5R4obOOCQdMsoz/6AZ
	E/e/lOCP8hbW2KNs2CyFmD5pAzqIdJL2vAPeS+XKe9AhJH07Y1XruTY7fwUYdmKlkhjOn0+btm4
	6lztkNKrhhzxo1jdlmWp53rAiZ/A==
X-Received: by 2002:a05:6402:51d2:b0:691:2ef1:354c with SMTP id 4fb4d7f45d1cf-695474bef0amr2441184a12.27.1781709647905;
        Wed, 17 Jun 2026 08:20:47 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949bcbfsm6575286a12.24.2026.06.17.08.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:20:47 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  bpf@vger.kernel.org
Subject: Re: [PATCH net v2] net: Clear skb metadata in LWT BPF xmit
In-Reply-To: <20260515104741.DF6A9C2BCB0@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 15 May 2026 10:47:40
	+0000")
References: <20260514-bpf-lwt-drop-skb-metadata-v2-1-458664edc2b5@cloudflare.com>
	<20260515104741.DF6A9C2BCB0@smtp.kernel.org>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Wed, 17 Jun 2026 17:20:46 +0200
Message-ID: <877bnxb3ch.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Circling back to this.

On Fri, May 15, 2026 at 10:47 AM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unconditionally calling `skb_metadata_clear()` in `bpf_xmit` causes a data race and corrupts metadata for cloned SKBs.
> - [High] Uninitialized memory read and metadata corruption in non-BPF encapsulations and `bpf_input`.
> --
>
> commit 2265e07ff5cfd9680de6b565a2b5679d5adafe20
> Author: Jakub Sitnicki <jakub@cloudflare.com>
>
> net: Clear skb metadata in LWT BPF xmit
>
> This commit clears the SKB metadata in the LWT BPF xmit path before
> invoking the BPF program. It aims to prevent a warning in skb_data_move()
> when bpf_skb_change_head() is called on packets with existing metadata and a
> non-matching MAC header.
>
>> Drop skb metadata in the LWT BPF xmit path, just before invoking the
>> program. Doing it late, rather than in ip[6]_finish_output2(), preserves
>> metadata for tc egress on the outgoing device when no LWT BPF program is
>> attached - the only scenario where carrying tc-layer metadata through the
>> IP output path could be meaningful. Non-BPF LWT encap types do not run
>> helpers that touch metadata, so the BPF xmit op is the only site that needs
>> the clear.
>
> Is this assumption accurate for non-BPF encapsulations and LWT_IN programs?
>
> When non-BPF encapsulations (like IPIP or SEG6) or LWT_IN programs use
> skb_push() to prepend outer headers, they shift skb->data downwards but do
> not migrate the metadata block.
>
> Because the metadata pointer is implicitly calculated as skb->data - meta_len,
> the new encapsulation header silently overwrites the original metadata memory.
> The implicit metadata pointer shifts further into the uninitialized SKB
> headroom.
>
> When the packet subsequently reaches TC egress, won't BPF programs accessing
> data_meta read uninitialized headroom memory instead of the preserved
> metadata?

I initially focused on the case where a warning is generated by
skb_data_move(). This can be triggered only from BPF LWT because the BPF
helpers have been converted to call skb_postpush_data_move() after
skb_push(), while non-BPF LWT encaps have not.

However, non-BPF LWT enaps mangle the metadata as well, as it was
pointed out. So this needs to be addressed.

>
>> diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
>> index f71ef82a5f3d3..d26cb9bb81893 100644
>> --- a/net/core/lwt_bpf.c
>> +++ b/net/core/lwt_bpf.c
>> @@ -284,6 +284,11 @@ static int bpf_xmit(struct sk_buff *skb)
>>  		__be16 proto = skb->protocol;
>>  		int ret;
>>  
>> +		/* LWT BPF programs cannot access skb metadata but can corrupt
>> +		 * it with helpers that operate on skb headroom. Drop it.
>> +		 */
>> +		skb_metadata_clear(skb);
>
> Since bpf_xmit() operates in the LWT IP output path which frequently processes
> cloned SKBs (e.g., from multicast forwarding or TCP retransmits), is it safe
> to call skb_metadata_clear() here without unsharing the SKB?
>
> skb_metadata_clear() directly modifies skb_shinfo(skb)->meta_len. For cloned
> SKBs, the skb_shinfo structure is shared across all clones. Modifying it
> without gaining exclusive ownership first (such as via skb_unclone()) will
> silently zero out the metadata length for all other clones of the same
> packet, causing them to unexpectedly lose their metadata when processed on
> concurrent, unrelated network paths.

This is not an issue because:

1. Only RX-originated skbs can carry metadata.
2. RX-originated skbs must be forwarded (routed) to hit LWT.
3. ip_forward() will skb_cow() the packet to unclone it before LWT..

>
>> +
>>  		ret = run_lwt_bpf(skb, &bpf->xmit, dst, CAN_REDIRECT);
>>  		switch (ret) {
>>  		case BPF_OK:
