Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DA8511221
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543229; cv=none; b=ROogFZJXA60YO9svhXrl9QwU4E4T90bsAokKL6ygtDi9/Wn4Tfm/dydNCCB8DuNQIY9Gcw4MmhIilY0oXPPFLLRffS4A20uWrTBfYWqbeGvwHh3x57Pznpjv4FjAj+MJsNrK8T2aUxlJEiM/61Mch2hEjaOeXXCb4sERmKukHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543229; c=relaxed/simple;
	bh=0ZP+HRnzu9z6DgT/BXO+5YVGLrMTir6BRcJGXtbrHM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcSaaO2zCsAA3n0r3Tu9pNjAryEOrkFmUxaXdmBaQHowp8tUnQGfBEG4jdZ+k5ArOlNJo817GljBmMg1+5JVPc5qmmsIGyhh5UMLPazuyqIquERyWutLJRXSHnjw5Z6VHjrvdv5p8A1lfcuBcHxL04q0Yw2ERtV6bu5580WC4ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKOSLYnH; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKOSLYnH"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b12ada8befso818543eaf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 10:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788543223; x=1789148023; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNzIgR372J08ntlK40uw/Lpu5PtLTk6ngTClcXiLgnM=;
        b=dKOSLYnHQ6+WDrEuG3sCYQB1SyDLVidU1/I7rPqcBCSluHFDLOnMhCkiRagQewSilc
         Tx/0vYE6Q/rwHHP132Hz6hl+oQa4hEAhJtmqD7HTYvJJGTGdE/Pr/XLtuUm/372HNr60
         cKvUCNiDH+xNn+3Ko3qz4YJ2MAG7d1q0+LG3P4FV+D9bMk1tm8SeNS0e7DPgzKs/K+j8
         agGorSrcNOoyV5U7cyUfJc8lZg7gK4RtqUIZumX9aKrDs226tGV9CI+nnTDwbD8qh6en
         dvExzID09wHpyvKCS7IQAFsvmMmZXbNqGuINm2Sua08n9S4YSCXS0B7ufFBUctizGRWm
         KfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788543223; x=1789148023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNzIgR372J08ntlK40uw/Lpu5PtLTk6ngTClcXiLgnM=;
        b=rKdXAEzlCV9rE9lyyg3shVM/RPqD1ZM7bq3M72Gj5LFhGQ/zfgb+izfKg05go3o2qy
         ynQ5ocOPONwjnkmrrNFy4FWHqOec+NNtA2x8f+DXYU8Kf257awyGijYBUalrfEVNQ58J
         82kmZAoOjtG+5QqvUuM8Yaj+uaEII+zpar8kxmLOL1WVqdiR569jEyzr1HujM2gpR2XA
         1j4W5d2Vsjw5Bkatbgycwduw9fT6/GrIczUxptg39jUlNFajQIjUibEDca46SyIJhPPY
         +GYPe/9uEDD5Sf4MoUcCOyfgJB2QvMytCbvD/dP/hEhEu1XAxSFUE1gn6xLFu+1C/tGm
         7TSw==
X-Gm-Message-State: AFuF++keNZtysne6sGWgtf6Hwr5CbaLhdaiSPPcZ4k8J7uDghI71De0j
	+S8GrjzpzsGNiji6RDUTucO74jcAd+ch8p+kMBwKkLYpajGybX/JghY5GRIwiA==
X-Gm-Gg: AYBFou34XrjpNcE40AtzxqYgBC1bRSxFpu2/woil2+mNyyux+zT/e/V25W2b1mvrRTO
	+ti3EOr+cOVBNUGUxyvTUB96V7oNzNP4dEr+Q8Xeniyuxf9glE+mW29/VsLbDa0kNQ1plLMz8Ri
	fJjKRbhJb4B9NLpDRS5bL+WXLldiZblg4M+t4JrC6JHDEEF5uNfv5Muq/ZiBiG4ZxsMZbUyOu82
	MSqle909Afuv18cVC451TPt5RcU3P4fKWSIN6/dpCe5+NKl7e678lnpX+gAVqTOEc+uo1ysTLyY
	BAxERfW3T8Rs89yn7K2GXz8bemYBAX3Xg8k3lNVT4cJWmimO/VMfSimtojSLOtSuG58kN4O5djW
	JemTEW8HykpbxKfISmF49I1w8JebKab4l3eOB3QkCxVlVghhAYc9EvAzfL79J1LaWYeBC/oO2Ye
	SkXa9m9HqFRrIpxwGhVTViOoFKzbLKp663ddd1jhDws9GMuLW6LOaAQzOChSgadDqTjJaJ1UHxV
	o36dt7Wzw==
X-Received: by 2002:a05:6820:81c5:b0:6b1:6462:7e4a with SMTP id 006d021491bc7-6b6fc7d69eamr7174889eaf.13.1788543223122;
        Fri, 04 Sep 2026 10:33:43 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:53::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dcb85657sm3425792eaf.7.2026.09.04.10.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:33:42 -0700 (PDT)
Date: Fri, 4 Sep 2026 10:33:39 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH net-next 6/6] selftests/vsock: test the assign ioctl
 privilege checks
Message-ID: <apsA808VUA8CrbCd@devvm29614.prn0.facebook.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-6-9995383e9a8b@meta.com>
 <20260903230147.63ACA1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903230147.63ACA1F00A3D@smtp.kernel.org>

On Thu, Sep 03, 2026 at 11:01:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The unprivileged user namespace test spuriously fails because the unprivileged user lacks DAC permissions to open `/dev/vsock`.
> --
> 
> commit 4c5b8557bb5663f827061639a80256407bfe6c8c
> Author: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> selftests/vsock: test the assign ioctl privilege checks
> 
> This commit adds two tests to verify that CAP_NET_ADMIN is required to use
> the IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS ioctl, and that an unprivileged user
> namespace alone is insufficient.
> 
> > diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
> > index 53591fa07f1a8..efb94d17d9976 100755
> > --- a/tools/testing/selftests/vsock/vmtest.sh
> > +++ b/tools/testing/selftests/vsock/vmtest.sh
> [ ... ]
> > @@ -1805,6 +1817,51 @@ test_ns_guest_assign_g2h_netns_reset_on_ns_delete_ok() {
> [ ... ]
> > +test_ns_guest_assign_g2h_netns_unpriv_user_ns_fails() {
> > +	local helper=/tmp/vsock_assign_g2h_netns
> > +	local unpriv_uid=65534
> > +	local unpriv
> > +	local rc
> > +
> > +	unpriv="setpriv --reuid=${unpriv_uid} --regid=${unpriv_uid}"
> > +	unpriv="${unpriv} --clear-groups"
> > +
> > +	if ! vm_ssh "init_ns" -- "${unpriv} unshare -U true"; then
> > +		log_host "unprivileged user namespaces unavailable, skipping"
> > +		return "${KSFT_SKIP}"
> > +	fi
> > +
> > +	# The home shared with the guest is root-only, so place the helper where
> > +	# an unprivileged user can execute it.
> > +	vm_ssh "init_ns" -- \
> > +		"cp ./vsock_assign_g2h_netns ${helper} && chmod 755 ${helper}"
> > +
> > +	vm_ssh "init_ns" -- "${unpriv} unshare -Urn ${helper}" &>/dev/null
> > +	rc=$?
> > +
> > +	if [[ "${rc}" -ne "${EPERM}" ]]; then
> 
> [Severity: Medium]
> Will this test spuriously fail in minimal environments like virtme-ng?
> 
> The test helper vsock_assign_g2h_netns is executed as an unprivileged user
> (UID 65534). In minimal environments without systemd-udevd to modify default
> device node permissions, devtmpfs creates /dev/vsock with default 0600
> (root:root) permissions since vsock_device in the kernel does not explicitly
> specify a mode.
> 
> When the unprivileged user tries to open /dev/vsock:
> 
> tools/testing/selftests/vsock/vsock_assign_g2h_netns.c:main() {
>     ...
> 	fd = open("/dev/vsock", O_RDONLY);
> 	if (fd < 0) {
> 		fprintf(stderr, "open /dev/vsock: %s\n", strerror(errno));
> 		return -1;
> 	}
>     ...
> }
> 
> It gets EACCES, causing the C helper to return -1 (exit code 255).
> 
> Since the script expects EPERM (exit code 1) from the ioctl failure, does it
> misinterpret the 255 exit code as a test failure?
> 

I don't know about systemd-udevd, but seems like we can generalize this
to non-zero exits just to be cautious.
