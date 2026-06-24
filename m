Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561040D56B
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782317985; cv=none; b=SzQ2AaDEWLWt85TIVom6SuF0PNdGoocYq2wS88Jwhtw3XQroXoEl0uGKyiIMQkTQ0WcaIBPtL/wbDUZ/+Mi3eo1wGhZDxjArkw5xkfb6hKLXyGIX27IJ9ZrmDEUhByry2KRH8HNIbzGzC0C7iPUR2jqDfyzXChtVh7f9O9EVpcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782317985; c=relaxed/simple;
	bh=F+7xCZ838SsuhcLjbt/+Ys1lu4nSl3ekRqDKSXm3q30=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XouXZvTj4N2Hbk4mZXATv+EKswPpcYx8ChaO0JJaHzv6WLYC5Y+6y9lOQTGPBQa6cPXzM/IP4npj2n8sRLDYq6QQEMfRy0vsqEJFv0NXVWooVOcJp/0x+2lAu092fpUG115gwog+2FMeuvUDurduC9+gYQgaJXrF5sQL3zXd9V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NqEIpD73; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NqEIpD73"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782317972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/H6/mFs/nTzS6NU0ky1ncY4ReP9dfctIPTJY/nGpj8=;
	b=NqEIpD73pXV9pVDNlIZ/c4hRT1ginUIT77qOM6z/GOt6ZBr+gl3aABybt308K5ocs44b7u
	bEdemPtv0aD7Xfz9FLjXUczuqQNgLU7Xbeh+4BmaUA4XZLvnbGDnIU0SG8SNuD6JJW30Qy
	AoIYmC9aqrgU5n4iPyroBj3jymfDqrw=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 16:19:28 +0000
Message-Id: <DJHEZNEVN0EI.HSI0MTWRCWNJ@linux.dev>
Cc: "Sean Christopherson" <seanjc@google.com>, "Brendan Jackman"
 <brendan.jackman@linux.dev>, <sashiko-reviews@lists.linux.dev>, "Brendan
 Jackman" <jackmanb@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-rt-devel@lists.linux.dev>, <kvm@vger.kernel.org>
Subject: Re: [PATCH v2 06/13] KVM: VMX: Use higher-level allocator
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Brendan Jackman" <brendan.jackman@linux.dev>
To: "Suren Baghdasaryan" <surenb@google.com>, "Yosry Ahmed"
 <yosry@kernel.org>
References: <20260622-alloc-trylock-v2-0-31f31367d420@google.com>
 <20260622-alloc-trylock-v2-6-31f31367d420@google.com>
 <20260622101056.4120C1F000E9@smtp.kernel.org>
 <DJFI4P57YE9X.20DPMTK9LL7LW@linux.dev> <ajm_dEqauYLBi-7T@google.com>
 <ajnTJ03IxVnBXWdp@google.com>
 <CAJuCfpEUZ-xL7ebW21Q=5wXDFuJSeh52Ei-8YLsRUdXiB5NiYg@mail.gmail.com>
In-Reply-To: <CAJuCfpEUZ-xL7ebW21Q=5wXDFuJSeh52Ei-8YLsRUdXiB5NiYg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed Jun 24, 2026 at 4:14 PM UTC, Suren Baghdasaryan wrote:
> On Mon, Jun 22, 2026 at 5:29=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wr=
ote:
>>
>> On Mon, Jun 22, 2026 at 04:04:20PM -0700, Sean Christopherson wrote:
>> > On Mon, Jun 22, 2026, Brendan Jackman wrote:
>> > > On Mon Jun 22, 2026 at 10:10 AM UTC, sashiko-bot wrote:
>> > > > Thank you for your contribution! Sashiko AI review found 1 potenti=
al issue(s) to consider:
>> > > > - [Medium] The commit message incorrectly states that `__alloc_pag=
es_node()` allows passing `NUMA_NO_NODE`, while the opposite is true.
>> > > > --
>> > > >
>> > > > commit 7bd439c242125db27305b61b14c9972fb028282a
>> > > > Author: Brendan Jackman <jackmanb@google.com>
>> > > >
>> > > > KVM: VMX: Use higher-level allocator
>> >
>> > While you're dealing with nits, can you massage the shortlog to someth=
ing like:
>> >
>> >   KVM: VMX: Use no-underscores API when allocating pages for a specifi=
c NUMA node
>> >
>> > "Use higher-level allocator" is extremely vague, and arguably misleadi=
ng because
>> > the "allocator" being used isn't changing.  Which is kinda the point: =
*nothing*
>> > is changing in practice.
>>
>> Maybe "higher-level allocator API"?
>>
>> no-underscores is just.. meh :P
>
> It's overall a good idea to add "No functional change intended" at the
> end of the changelog in all these cleanup patches.

Oh yeah good point, I'm adding that for each of these "remove the __"
ones and some others.

I'm skipping it for the ones that are trivially identifiable as such
(e.g. "move function to a different file" and "delete unused function"),
but let me know if you think I should just add this note everywhere
instead.

