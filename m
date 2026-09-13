Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5832D42B
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789319147; cv=none; b=SYXOmaXLu7ph/vhimIIfdx1BtDe6d8A7AlNHnzUmYf0kCXfFfSxoll4GaXSeEktpKhuEQg4FfbgROoeRC7sO4UIGCbJ9gYjKZN8PY04VQbeEFqEkxKfC/lDjZGi708y1g8qH618+eewOxqRlKI/4zjARpPamRcpisEvRkc176A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789319147; c=relaxed/simple;
	bh=owZqRcM8Xi9fRt3ZDy6dU7srkF3vDjAP0nt1xyecOoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4UhCBgnCB342aHxvzj1kXPqHzNqGpJ24E/AZska4UI4zdc3YUZtJDtcy0ZGcad0mRpTyZ6r61uZpS3+odtPEkc/3FOn4t4u03/hSEt3uzjUvPvgZ7uPZXurvC3pxymEW8zMuhJEvOKrn1fh0jRjFkmQ+v8KQ1ybvXMvFHIujzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQl8KoIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQl8KoIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1E81F000FF;
	Sun, 13 Sep 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789319145;
	bh=esrKaC3nquF2tM5PphqR1dq6HbZYaQl48+WzX6mZbUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fQl8KoIs+gixjLmTs7oozCegF7qzJp81r7JpNi01vEk+h8x0twiQ58AYf30937IiO
	 emDhdBypP2RsCvKgfLl6wvv9cHbZKI45AKpEjS1LdkT46vOrDtIYsH+InAaAVB5uFe
	 vVCbxuhQAd0tLEp6HkjEG8R2+jKtMQEabwU+g/hi8mde2pfd2PMlOqrIOeCnRmhpfX
	 EmQc2LMMCTRv/IgQav2x0leztMKsCAf+G8+BmYiHRz9rgZp36D0Fybg7nnf3FkPpG5
	 txF9UZTX8W36U6L8UEQUpBmoCphy0xRGi5qaFDB5t7M7UB+HLsmZAb63lRrqUoQRSH
	 a09Jox7LkEqQA==
Date: Sun, 13 Sep 2026 18:05:42 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
Message-ID: <aqbXvZv43RFjXg-N@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
 <20260908211043.D350C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908211043.D350C1F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 09:10:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Binary file `out_bin_file` is opened with `"w"` instead of `"wb"`, which can corrupt output on host platforms that translate newlines.
> --
>
> commit 8a28ee77f330c86631e4b29d33b55c73c4d0f181
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> kallsyms: output binary data to speed output and kallsyms assembly
>
> This commit modifies the kallsyms tool to output byte tables as binary data
> and import them into assembly using the .incbin directive. This is intended
> to significantly reduce the size of the generated assembly file and improve
> assembly times during the kernel build process.
>
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
>
> [ ... ]
>
> > @@ -813,14 +856,26 @@ int main(int argc, char **argv)
> >  			usage();
> >  	}
> >
> > -	if (optind >= argc)
> > +	if (optind + 2 != argc)
> >  		usage();
> >
> > +	out_bin_name = argv[optind + 1];
> > +	out_bin_file = fopen(out_bin_name, "w");
>
> [Severity: Medium]
> Will this cause the output to become corrupted on host platforms that
> translate newlines?
>
> Since the file handles raw binary table data, opening it in text mode ("w")
> instead of binary mode ("wb") might cause newline bytes (0x0A) in the binary
> symbol tables to be transparently translated into carriage return and newline
> sequences (0x0D, 0x0A) on platforms that do not use POSIX standard text
> semantics, such as MSYS2 or MinGW.
>
> Could this be changed to use "wb" to ensure portable byte-for-byte
> correctness on all build hosts and prevent corrupted vmlinux images or
> assembler errors?
>

Linux kernel requires a POSIX host where 'b' is a no-op so this is nonsense.

> > +	if (!out_bin_file) {
> > +		perror(out_bin_name);
> > +		exit(EXIT_FAILURE);
> > +	}
> > +
> >  	read_map(argv[optind]);
> >  	shrink_table();
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=4

--
Cheers, Lorenzo
