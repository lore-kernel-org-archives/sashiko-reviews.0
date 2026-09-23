Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A23563FB
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136917; cv=none; b=fxwUS1gk/ysjD2/VLIRupn6Hum9QFPXGVgRZMIljVZJuiMvlUAvbQX0Msok/+Le6KMfc5Psw60FQJGEZ1PyTeVJivv9EaI3at6XDk2/nR97suaxFfn7CJTpRffaTXfUhY2ftaMHsAjWi7xBA9Vv6kISkdG2WKTeY0n7hI3GUYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136917; c=relaxed/simple;
	bh=EmtjjFbvf9N6mnSLk6CU9IL+h0+QvyYJcJKARdjj4+Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=E8GPCxFZdqQWDDERSRwKw+FlV1HoMe4WILCmVj1j3zIDth83b6Ad5TKn0DE6qzxSj4AxkBCsNM2rhAeGcpj+Y0o6tuLuTfandUT6nAk87mpacaUiQlC10DKxedyQZz//FW4nNUiZrLoOLciio/0WYstMmXTjWqgZ6E0Nte1R7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bob7Kwcj; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bob7Kwcj"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so208654a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 21:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136915; x=1790741715; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MPdKPSEqjmHlLSl7qHM1sfV3taojEaErQs6q44g369Y=;
        b=Bob7KwcjbX7zMciij0PyUyF3Mq9nyeQGUgtMSnL7zfGZOOPgrFjOgHogtlRtCjgAku
         LoseT+mNztS5Mf2zM2Vj4woi1IavaOIQSX85xPhtlW3QLRiFEN8r2JjhUJDSPM22xR2u
         3lotrDFAV4L0UFvl1Ab0gA8+Lnw66S2EOHm5rGR78tP2SGUMgqpdkW3pMSfnm4blxZv1
         4H61xQiwgbucRX/ovU6FHGn//KrkMCfaimJMvR64g5EckzFGN0i23bf/xclHq69Dq+4I
         SG1mduIqJsqnr9bINYjxgfHFSVlr3/+jeDnvLJHhkzNm3fmWIY5RiDwb7G7jCaamQ/51
         qsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136915; x=1790741715;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPdKPSEqjmHlLSl7qHM1sfV3taojEaErQs6q44g369Y=;
        b=cNJC87OCniK1kLFYsKLdUt8WCa3Z/4h1QvNT0VgZniNoUrI/+9N3ty8OHhkeIjT3BO
         CcDoheCu9v7uOcih9HPwoohT7Fwh952JGiF74RwKNu1WinV+Dy8iLPmhqfaeEZxMFSku
         AChsUQCxi5sYK5sm4sNv7T5FDHBck+87ZwJNG9v1zpkzV2VAhkcACi5EvdOAl1SKPE4g
         fhN4o0vn+ogN59ARZ6fzSjIjHcf4r2kjdCBSXkrCnApIxfmmkpxMKm7+UxuP/sPxIrX5
         D1w6fxx4eO2ywvHTVNIvajhH0Goy481hTEczLM7NeybPyxB6ecL9Z5Zd+sG8D2Ksd3NY
         erbQ==
X-Gm-Message-State: AFuF++nXHPZCbddwor6zLYHKN0yvlDEUUw0/ohyMiVbr5xBg+S5/wv46
	ddypj7LgOfKP5t4EcGOAm4bFSpfyNJrm70WD4inH+aEphhTVamlVoOw1
X-Gm-Gg: AYBFou1rX0cfPA4G/a4VGT0awE76rVUWjUrMiAX7Sv6apkfiXVQ44LKaobB/78Ca4B5
	s5YCCdk+OlnAXKhe2mePXA1IR28dN1llVpBsYL/JiFkXpRwWWJMTsWBQq3KI7lQwXHuA1K5kn69
	SXnJOF0V4F4zIEtbSF8yM6GwsUviFHfjs57Khy7lPmO+XaTK7vLEpUkCB1C4vEy9uY7h/6zoQ0a
	i5oZPU1eAn8h+mHUMlLdZX07e/Uqq0U99S5ZH4bv9gICmtpvTcFu5OIZJO3AAQqNdwu2lJy+Ef6
	EJX23xP7CT8dU81Ag/ioFavUVoIalO/i6ammd1ziT+XXdtCqSsffYuxYGIqMvIEOQ99ua1M4KMp
	ma8b1eN8rc+Gx0SkGxALHC9f/9cD65fb5swqUFg4DUsnYez5z9xbOkHDn9IRlw6llNOnketVZ3U
	V4BHNuG4oK97i3jITOGMzOZuq1UQSnim8dzN1WhWrhYaCH5ry7XsFja7G8ZL88rfzIphdm2U6AT
	+RAkTlz7pc/8J/bvTUyiYkrex6ugXGRx8LWQUfwaD8InHuFaeYb8JW0xn4ht0Y4g9MiLwDZABHh
	oX8=
X-Received: by 2002:a17:90b:2b4c:b0:39e:1ff0:331b with SMTP id 98e67ed59e1d1-3a07e4f7b61mr1235002a91.2.1790136914637;
        Tue, 22 Sep 2026 21:15:14 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2469860a91.4.2026.09.22.21.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 21:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 04:15:13 +0000
Message-Id: <DLMEKP1LHU07.31JTP12GKADU8@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4] bpf: crypto: Use AES-CBC and AES-ECB
 libraries
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260923032703.59816-1-ebiggers@kernel.org>
 <20260923033742.D45A81F000FF@smtp.kernel.org>
 <DLMEAUZ632XP.210Y7S9N70NHW@gmail.com> <20260923041124.GB42709@sol>
In-Reply-To: <20260923041124.GB42709@sol>

On Wed Sep 23, 2026 at 4:11 AM UTC, Eric Biggers wrote:
> On Wed, Sep 23, 2026 at 04:02:22AM +0000, Alexei Starovoitov wrote:
>> On Wed Sep 23, 2026 at 3:37 AM UTC, sashiko-bot wrote:
>> > Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
>> > - [High] bpf: BPF_CRYPTO is silently disabled if AES libraries are mod=
ules
>> > --
>> >
>> > commit 1bcee0286f1c7c6c86befd107081ebb8a0fb0eed
>> > Author: Eric Biggers <ebiggers@kernel.org>
>> >
>> > bpf: crypto: Use AES-CBC and AES-ECB libraries
>> >
>> > This commit reimplements BPF crypto using the AES-CBC and AES-ECB libr=
ary
>> > APIs instead of the lskcipher API. It adds a new BPF_CRYPTO Kconfig op=
tion
>> > to conditionally compile crypto.c based on the new AES library depende=
ncies.
>> >
>> >> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
>> >> index d7d25477ef481..a44ecfa3e9ef5 100644
>> >> --- a/kernel/bpf/Kconfig
>> >> +++ b/kernel/bpf/Kconfig
>> >> @@ -91,6 +91,15 @@ config BPF_UNPRIV_DEFAULT_OFF
>> >> =20
>> >>  	  If you are unsure how to answer this question, answer Y.
>> >> =20
>> >> +config BPF_CRYPTO
>> >> +	def_bool y
>> >> +	depends on BPF_SYSCALL
>> >> +	depends on CRYPTO_LIB_AES_CBC
>> >> +	depends on CRYPTO_LIB_AES_ECB
>> >
>> > [Severity: High]
>> > Does this dependency logic silently disable BPF_CRYPTO if the AES libr=
aries
>> > are built as modules?
>> >
>> > BPF_CRYPTO is defined as a bool in Kconfig but depends on CRYPTO_LIB_A=
ES_CBC
>> > and CRYPTO_LIB_AES_ECB, which are tristate symbols. Under Kconfig rule=
s, when
>> > a bool depends on a tristate that evaluates to m, the dependency evalu=
ates
>> > to m, which downgrades the bool to n.
>> >
>> > Consequently, kernel/bpf/crypto.c might not be compiled, and the crypt=
o
>> > kfuncs could be silently stripped from the kernel. Existing BPF progra=
ms
>> > using crypto kfuncs will fail to load with "unknown kfunc". Because th=
e AES
>> > library symbols lack user prompts, users cannot manually fix this by
>> > explicitly setting them to =3Dy in menuconfig.
>>=20
>> The bot is correct. Looks like a regression.
>
> Users can enable the libraries indirectly by setting
> CONFIG_CRYPTO_AES=3Dy, CONFIG_CRYPTO_ECB=3Dy, and CONFIG_CRYPTO_CBC=3Dy i=
n
> their kconfig, as the self-tests config does.
>
> I do not know what you expect.  The libraries themselves do not contain
> independent functionality (besides functions that other things in the
> kernel can call) and thus are hidden symbols themselves, as per the
> usual convention in the kernel.
>
> As I said on v1, if you want a prompt for BPF_CRYPTO, I can add that.  I
> can't find any other example of kfuncs having prompts, though.

No. prompt is not necessary.
My question is why disable BPF_CRYPTO when these are modules?

