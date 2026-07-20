Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBDE3CF211
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544105; cv=none; b=duMJC9YvCqf56KFrPKzUVXc4ASn0v/ZdxfGuoUTLua1Rwjf6u5bzogvtmraH2BPKXFAvqr5tNN8LSdrL8xvR1xd9a7E0bWwd/8cKpCCZdP1cnQeTqjFonNBgLmncLCgPS9D3Zp7uJrS+vLMMjMGpVkb+jR9/7G030c/m1ySeFP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544105; c=relaxed/simple;
	bh=7AIZV6ikm+f7Vp88ExXBmJtyqrAuf5TUyp94rGhxfMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCGAhcf0m4TooQ8OoY76Usd/ImjpyYJ3RnnU+BiTf4qyR0Onm+RzzR5M+HdxzR8OvkfpXWpbFB6dKEM9CH63lsaAKz5BIII0i1nWlHUxAgT8qbFsUtDwMlGDG1HE0tPsvnX2zavS2nIWfL4MqpPP7+r9tCIngJr3L70MaJ/6TIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knSZ8VNr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knSZ8VNr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f75f7172so78076215e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784544101; x=1785148901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Xz/6qEDyrPzu6QgGCWx4KiBgrI/vNssPvEcJi05ZpI=;
        b=knSZ8VNrSRE9DLRaFSO/z1+1YobLR7UDB9cwv3FvPYvmqN9PQ9Gve1nQfIgnpzDGbv
         wTadY9yoxdy3ji62qKdUUinDtFeoRiXfh66bBCNtiO4JbJXDHESMLHzAG2jmmPhJ+YMD
         2Mw66ihWsDx8o+1+Qy8e20rWMc2eFKOxPSYdjjGJU6cq7lrEeTmGAsCZtmF0zq5ybfiq
         4NE4qwJZbTnhrIgkx0CEy8XvE8UXzUcIZQ2jwDC4yHMou68Kg6CrIkljYelo36Dkj3IP
         H2UXaqGNcab67ghXs5I1xtQOtnz+r1sctKci1zqSBypU2+x2BDQetpJlop+FRhcQE3XI
         UjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544101; x=1785148901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Xz/6qEDyrPzu6QgGCWx4KiBgrI/vNssPvEcJi05ZpI=;
        b=ntoDmqKqUCzJgpfOJa+XZ2dUklSrYKTe34NIAyi8QjeulHFC4hwy6qf82YBEGyWQQW
         xXbrL0yn6p1RG1D0yu7C/fy1RiuLDV5QNJ8qdhBNWrdlHQ+ZGvIWHNVXK+6tlJGIAUNe
         wIXTdeplUE54N6qTxsG+v5LkpCVlI+oLUVbAbZAgYnNA3naE3YdFlb0R7wmHp7sYYTlj
         w34ijgHWo66mb0HhOYU+deWtkY0svRazSGVHiVnTljT9V7Jt93QWHFKMewKvU0giTZGr
         3kaPns4XaEuLtTZe/ltlRLeAknv+YcXsKunXAfwRn/+VZFhdDCT/fe4KbwQAw91AXZog
         OqUQ==
X-Gm-Message-State: AOJu0YxQK35IdOn+dBsRtN+JzcBev3TgyKJBi/z8gUSvB0uIYSG4vCot
	q5mT0Ru0h/KGYTBBqhkcF9x1fa+EQb5JwHDSr6jXXSAtTwY9c03Ae6lLgeQlijVe
X-Gm-Gg: AfdE7clg2i5+8UDrk2jV9uNvE1E8MP1Qt+5cfLbDeMdjStxr3hg7H5f8ThxgSBikQCv
	FtluwSU8eNRZw9Nd8EqOUaAt6zIjrI3CFQxVjQ3KHZqqPM+BuEXVgfVT+ebCr9n912OYwAkzJXh
	g3n/dFlfXuZZacwaeniX0260TUiobPm9T35CQGMRFoZ7R8XuwbkVfrx/GPNasbEb4OBfAT7xEiJ
	VOGzyVqeLH1NKijDatr3RMQIeeoJkpwX/wVnDJ4/ePjp0yTftOdB3qEXS7on9WydEfr++Y2lqDU
	WU75on4BATeATUIjP2aaG+00vioYjZy+wat5r6imZ5FboeLv5do+Lgm/SV9BI5D2Rzc6SbD+b+w
	g8SOusvwWhJGggticUnDPCSMDn5nu800wIETQVQJ7RZgDCbEm+6l4SQikt/Aq2/oh+qvq0OTMex
	IpXur+Akj7/1d/xxozEosYPTfTsxD7eJU0tJOHs/UTKgoolDftkjertHcw8ozxumhvZw==
X-Received: by 2002:a05:600c:4743:b0:495:406c:81d5 with SMTP id 5b1f17b1804b1-4954a50b8b8mr156161615e9.28.1784544100735;
        Mon, 20 Jul 2026 03:41:40 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm29695130f8f.1.2026.07.20.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:41:40 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:41:38 +0100
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v5 1/2] bpf, sockmap: handle spurious tcp_msg_wait_data()
 wakeup
Message-ID: <al3uUF4FaneGEvmB@localhost.localdomain>
References: <20260717155348.54975-1-nnamdio@gmail.com>
 <20260717155348.54975-2-nnamdio@gmail.com>
 <20260717170146.A8CCB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717170146.A8CCB1F000E9@smtp.kernel.org>

On Fri, Jul 17, 2026 at 05:01:46PM +0000, sashiko-bot@kernel.org wrote:
> 
> [Severity: High]
> This is a pre-existing issue in tcp_bpf_recvmsg_parser(), but this patch
> copies the same logic into tcp_bpf_recvmsg(). Does this create an unkillable
> infinite loop if the user calls recv() with a length of 0?
> 
> If a user waits for data to be queued and ensures an error state is set (for
> example, the peer sends a FIN setting RCV_SHUTDOWN), and then calls
> recv(fd, buf, 0, 0), sk_msg_recvmsg() immediately returns 0 since len is 0.
> 
> The code enters the if (!copied) block, hits the RCV_SHUTDOWN check, and
> because !sk_psock_queue_empty(psock) is true, it executes goto
> msg_bytes_ready.
> 
> Since len is 0, the cycle repeats immediately without releasing the socket
> lock or checking for signals, pegging the CPU and potentially causing a
> soft lockup. Is there a way to safely break out of this loop when len is 0?
> 

I don't think this is possible, as both tcp_bpf_recvmsg() and
tcp_bpf_recvmsg_parser() have an early return (before the loop) if len is 0.

> 
> [Severity: High]
> This is a pre-existing issue, but does tcp_bpf_recvmsg() propagate an
> incorrect -EFAULT to userspace when receiving a 0-length message?
> 
> If a BPF verdict program redirects a 0-length packet (such as an empty TCP
> FIN) to a sockmap socket, it is queued as an sk_msg with sge->length == 0.
> 
> When the user calls recv(), __sk_msg_recvmsg() in net/core/skmsg.c
> processes the element, sets copy = sge->length (which is 0), and bypasses
> copy_page_to_iter(). It then evaluates if (!copy).
> 
> Since copy is 0, it triggers copied = copied ? copied : -EFAULT, returning
> -EFAULT.
> 
> Because -EFAULT is not 0, tcp_bpf_recvmsg() bypasses the if (!copied) error
> handling block above and directly assigns ret = copied, returning the
> -EFAULT back to the syscall caller. Should this case return EOF (0) instead
> of -EFAULT?
> 

I can reproduce this in a selftest.  As this patchset is addressing
EAGAIN errors, I'll send patch for the EFAULT separately.
