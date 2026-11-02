Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645687;
	b=qbPuluL/AZfxy1cnKGrjZKe3TdALvZiHPqkNNi53oz3KkukvKq9tJP5I4zfxSa9iwW+x
	 DeIXITFg3QZrteHk87ORz09v7KB0XbjjWboi4xJeMajNtvSyoskJX2aSlT1KKo2cr90wX
	 Lvg64V0W4vMmFLXYP8nRGSOffOANTT4FVH3sx1YH8Enc/Y4Ri4IoE5dXIZ2Joxti7M8Iu
	 GmG9/ZTs0Q+xhXTNb/428k73GXUiE7DBAtGOmc3cIkj8Qsj2SP145JpUlXM98TOu8MZs/
	 413pbup3Q3+Ix1BTZIrvLRXonx99m3qkXpOK2DVQPU/QnYrsR3xq+OscZhSrwerM8AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645687;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=xgjdHufMSmd+Nfae0ssKqTRKSvgsZzVtNtqZY27gNlo=;
	b=pfyxUz4PIdqq1H67XisT5+ffYGUFR7UE6hNZb4z0JdylndYJORcBOKQPtc6KMsoKzKso
	 HeZD/KXWHYo0fPowi7F/+xOTYNhOkO4zqJGSmKOgetoHBaYm8o1OdUFUk7bJanrv5Wg3Z
	 PDHQ8eJwIAmt9H/wr8zqvU0hHdm5XSovNbk4bpj94RimbWqXDkYdFlFvNcEO2JScYKZ/j
	 s0gKg93J6VbgzamVCQQDdYOzUpRjbSoPHVRvYd0N0tLC0UxSEwEyG0IUPSBUvjT7T8AFo
	 nvLg7TB5XhRcsEm3Ep7kwEvHAfPgUresWZvrtyYogEYkslOQAqF3GnQgbpjQv4FoO3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=fwzhzVMn;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFE7606A324;
	Mon,  2 Nov 2026 18:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFE7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=fwzhzVMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xgjdHufMSmd+Nfae0ssKqTRKSvgsZzVtNtqZY27gNlo=; b=fwzhzVMnJy2T4ucvquHUNyGjqy
	/B6qj9t0/AyvaC4Km768FBHhYZ6GnybnBmhOHBAjY96eJobVIowwDPMtg0gloqRYcWCUWZv6Iodez
	heU2ahJY5G3VYWkwEtTi8rq5otJ2EQWgLQlN79j1ApdA+pi81jygVm5OFFqV2Mxoic5cOSyYbFOdW
	9SwsQzmLBc+kN11+Xjw26vvwnCGAbmZQ0dEO52/bWY+IAPs8DKzZOAINNaalufJ8I/eqxxzBgNfpG
	vGAC2B1LP8PFa5dASgypmu0JidMs+dodf+ZOgi/8TgweSzP3srKnZNopE56n+NbrLaMyhgvEnr8yF
	IW2FnNvQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xNxB5-006MQW-1c;
	Mon, 02 Nov 2026 18:54:43 +0000
Date: Mon, 2 Nov 2026 10:54:38 -0800
From: Breno Leitao <leitao@debian.org>
To: sashiko-reviews@lists.linux.dev
Cc: Petr Mladek <pmladek@suse.com>, 
	John Ogness <john.ogness@linutronix.de>, Kiryl Shutsemau <kas@kernel.org>, printk@lists.linux.dev, 
	gustavold@gmail.com, samuelcrossley@gmail.com, ryan.roberts@arm.com, 
	brads@mainlining.org, x86@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] printk: nbcon: Flush unsafe consoles from printk()
 in panic
Message-ID: <aujcS5yK66xvOt9q@gmail.com>
References: <20261102-panic_unsafe_flush-v1-0-12d1e22fd6d8@debian.org>
 <20261102-panic_unsafe_flush-v1-1-12d1e22fd6d8@debian.org>
 <sashiko-outbox-193942@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-193942@kernel.org>
X-Debian-User: leitao

On Mon, Nov 02, 2026 at 06:29:46PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] printk: nbcon: nested printk() in nbcon_atomic_flush_pending() corrupts state
> --
> 
> commit 8683fa106aa2304e041764eca5971a98495ef1b9
> Author: Breno Leitao <leitao@debian.org>
> 
> printk: nbcon: Flush unsafe consoles from printk() in panic
> 
> This commit flushes CON_NBCON_ATOMIC_UNSAFE consoles from
> nbcon_atomic_flush_pending() when running on the panic CPU with
> oops_in_progress set, so that panic messages reach netconsole before a
> panic reboot or crash kexec.
> 
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index 5f8afaca88665..19fa9f79cac3c 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> 
> [ ... ]
> 
> > @@ -1688,7 +1692,15 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
> >   */
> >  void nbcon_atomic_flush_pending(void)
> >  {
> > -	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> > +	u64 stop_seq = prb_next_reserve_seq(prb);
> > +
> > +	__nbcon_atomic_flush_pending(stop_seq, false);
> > +
> > +	if (panic_on_this_cpu() && oops_in_progress) {
> > +		panic_nbcon_allow_unsafe_takeover = true;
> > +		__nbcon_atomic_flush_pending(stop_seq, true);
> > +		panic_nbcon_allow_unsafe_takeover = false;
> > +	}
> >  }
> 
> [Severity: Medium]
> Can a nested printk() or WARN() inside an unsafe console's write_atomic()
> callback re-enter nbcon_atomic_flush_pending() and corrupt the outer flush?

Maybe we want to make panic_nbcon_allow_unsafe_takeover a counter
instead o boolean, and increment and decrement it instead of true/false?
