Received: from mta0.migadu.com (out-67.mta0.migadu.com [91.218.175.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E8225393E
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 14:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394501; cv=none; b=QoBNHtfkCr1kQhGHeWp2B1VRUBtHTnClqS3znMuOKvo6BMzJwK752WFB4wHW7WhjORKo/X8bMAPb552RU6cD3I9RGB5zr1ChWaor+ZixhyuPtiqzsbZyPZ92o4N9861HbjCjBXstF9O4LR3TcrwDL2Yj8NonaA5zFaml484mVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394501; c=relaxed/simple;
	bh=aXjrtqiXJoA/LX+vo9ztIrGq5juji/Jt2LOumdsvJdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4GoqSI/El+WCkhG2WkUXOk5uz1L831gPe3+GfAVmvJ+T50QeDiRewmhHAMGV2+S+4zaNFQAkNffyqJKc7KEssC3CXuNtI84UwAtAFgZvoZ5c6TGPNEv5hsLdnhvuZvWB6l7qy02+TmyVlI46oWIoIQz/337hDmmVwjN4CPyUfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JVtP0ktj; arc=none smtp.client-ip=91.218.175.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JVtP0ktj"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=aXjrtqiXJoA/LX+vo9ztIrGq5juji/Jt2LOumdsvJdA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789394497; v=1; x=1789999297;
 b=JVtP0ktjI4bEaV4lzWwY8nkyqmIeTB29pbK43vzPnchQHeDB6g34s+MdYB+OcUAGm/30bkKQ
 YY93/hB6wytw09gRP2/3ykuaVqBIyoj28YIhrZpvVyhQ2rhwPQkwjMD7tYRvSyxajf6ZUtCecDU
 iwtimOUm60gb2ZF70a6tbiyM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d6dfe07813e6baa7;
	Mon, 14 Sep 2026 14:01:37 +0000
X-Mizu-Trace-ID: d6dfe07813e6baa7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so8088e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 07:01:31 -0700 (PDT)
X-Gm-Message-State: AFuF++lhoe6HKGrWmLlBEsK8jQlxW1Y7Y9G/E+b9W1TQcqL9LkfH9aiW
	OPAo02dFNHDuWuP9ShulSrw/bzF0Rtcas9aU1AqsEMofTo9d5/SqN7pAkF1ekG8N1lLmDiSwJJx
	AKx4Z8B6WQdG9olfu7SbnE6iLkYviXEbnAUVLu5Hk
X-Received: by 2002:a05:6512:118a:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8af7bc5c0mr67742e87.15.1789394490822; Mon, 14 Sep 2026
 07:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-4-fuad.tabba@linux.dev>
 <20260914130152.F0D5F1F000FF@smtp.kernel.org>
In-Reply-To: <20260914130152.F0D5F1F000FF@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 15:00:54 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzHZTdjKUucBvZKDbxHAcnOHMBZxJRevA+GiWQDP83pOQ@mail.gmail.com>
X-Gm-Features: AcwNN1XihQ6L_5NZ9k6Ku9xDFQszoCROVzbsUjq5p0JBwaP6L9c0nu0dTTIBf6E
Message-ID: <CA+EHjTzHZTdjKUucBvZKDbxHAcnOHMBZxJRevA+GiWQDP83pOQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] KVM: arm64: Pin the host vCPU before adjusting
 its PC under pKVM
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sep 2026 at 14:01, <sashiko-bot@kernel.org> wrote:
[...]
> If a userspace process creates a VM and a memory slot, and then immediately
> deletes it via KVM_SET_USER_MEMORY_REGION with a zero memory size before
> the first KVM_RUN, this triggers kvm_arch_flush_shadow_memslot().
>
> This unconditionally calls kvm_tlb_flush_vmid_range(), which issues an HVC
> call that ends up in handle___kvm_tlb_flush_vmid_range():

With pKVM enabled that path doesn't get there.

[...]
> Since this is the exact same sequence described in the commit message (a host
> pointer unmapped at EL2 being dereferenced before the first run), should we
> also pin the mmu pointer around these TLB flush operations?

The handlers are unvalidated, but under pKVM the host owns no guest
stage-2, so none of the kvm_s2_mmu hypercalls has a valid caller
there. Rather than pin, I'll send a separate patch that rejects them
when protected mode is enabled.

Cheers,
/fuad
