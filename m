Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00714326923
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667061; cv=none; b=iGQn+SCJpfwcMcnNpTvTa2VC2mrSdRVSL+cNJy64TTCF/eZjqk0grOJoa9XhymYs9wKBg43c4lhNNFst5EBXDca2pVatWO2YmbEyQklvAenbLb/0t/VWNGCO5bNgyd4qUi5hz9PNyvX7WokCH0fb7QfK5ZWKBFhZTTFFJ76v6BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667061; c=relaxed/simple;
	bh=fjf1uQejVeOJ9fn7LjyfkZZCewgephLotbm/g892LTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THckcMUaGzUcSGrIxyMWgWVLRD24Ivxk+GaY+MfxkhYuEMjlThbyyZGw4E+cYTCy172lroztxOf8rh/YBS5OLO+5PTW1JQezJuJQjiZHq6HyRB1qK3Bt3h9ahN/zitIQ6Bf6KeLJ6nyaWIUjCAjxfzjCHjSsHl2+p3kT8BWv1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EY3ix9WA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EY3ix9WA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso22791455e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 06:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780667056; x=1781271856; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PdsfWOnLuuY9elhMzfIfrh1St5S/FY4B3lK+KDhQ7jU=;
        b=EY3ix9WAg1TH2UixilQ33APEK5sgRo8DrJUltNG1cw5d+PZMw9mbVAjlLWiJxD8QZ6
         GdTfvXK0DFABwExkaMcNRX51VPz323cDYEYv24HhJnGc5h0AlrdVT2O2CWk78gv3OvIm
         QmPk0HL2EZ4XnJcWSQa5uBSUlwiUHWR0nGSz/1RwSe6XgYTsRI9hxRkNB+U513NONy93
         Il+VV0tA8joSgJjR9oIIc85ro/nRE/P/KZDsKI1GTS+V91yzgmaCqDRWmQRiX4Wm46or
         UVGK4PtZzOhxMmwViP4o1QfyH/Y6v/HOzuqh0sQc9aGTputex7159VpIe96dx8lYsU3J
         2W7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780667056; x=1781271856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdsfWOnLuuY9elhMzfIfrh1St5S/FY4B3lK+KDhQ7jU=;
        b=QN7LlSThT7QBaNWAVWE/Stku6Vbo0OkEWdaJbi4oo+F/fb9zJlsQ5k/s+S1u4l5UfR
         EmeUpqiSL948OBnw+DxR8Ee37tYnSr2tiCrbApiTnRr95i8zsqyxrgzxs8D5mBas4w8w
         YSKgy39Wh/CaGmGDMVnO3QG9Q7Iqxo9ZxVAYK0BbgTdKWyCuJnxSg4lsIRLWNrjz9iL9
         NdTM+gIxwFM2gB81WPUPBJ6+DjLUAYp6gZigXUL2wM1/lOGlDqxnxNderrWR1iW8iH8N
         pIA1UJGYbAztp9BuNB8an0hsxtpj6Ea72Smi5DYLkOYlAz89dCC3NaDQMBTeGUOktNk3
         EtVQ==
X-Gm-Message-State: AOJu0YxayeJxdAkr4h+hd5Fnu4ZRli1VY2UcpcG8LQu0YGgWpLAqFyA6
	qBaiBBELsiZAyQ6SxL3JxguEeoU/Nx8dMLngPyG50/eJpiWPuckzgrUDN1W3/ZBj+4Y=
X-Gm-Gg: Acq92OEu2sBqnvOovBXxWZxXbc7y2qhVdMKbJWNqJjgGjhh5FEvhCNM9JxiUL7oO/pb
	c+Q0jRtYQmftuzLZee0+d0qIr7YlQqEi5HUEentUcXCRPXDbUzNAYnJglrQ36JUTK+Dj+NrrYGB
	mQi8Aib4Atj9xI7onJHLI2/TXS9ZqbJNCZu87GNcjVyKOazpJxnkrZyWScoIi2aJ/mIlEpqvbUB
	dVc7SXOPp8IjiRGmoxaVbFUtJCK0+N/j20yK8O2Vz1r4O9iJz3HwtObX31+mLor8DUVhfv4n0rv
	26s7vP+JN+DyTxOhd4b/JhK2+IaepvuTAypumJY+u43eWtNgdyrVEmYIVwFipazvqI3OaMUp3Ra
	Yzw/2pwYR33T2s9RoGsrLeLRsbAkEQK/tppBuQ6Wyf9OPxJv+kmboJ0fLR0sJTyL0Gnu3q+riIM
	LUc1x+DY51KKP0cCoSUv/xu3auK0FOTzRljB3D
X-Received: by 2002:a05:600c:828f:b0:490:b3fe:9732 with SMTP id 5b1f17b1804b1-490c25dd6aamr54022405e9.16.1780667056226;
        Fri, 05 Jun 2026 06:44:16 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d2d11asm63158325e9.1.2026.06.05.06.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 06:44:15 -0700 (PDT)
Date: Fri, 5 Jun 2026 15:44:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: sashiko-reviews@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, live-patching@vger.kernel.org
Subject: Re: [PATCH 1/4] selftests: livepatch: Introduce _remove_mod function
Message-ID: <aiLSraCKXmqYExqA@pathway.suse.cz>
References: <20260524-livepatch-unload-on-fail-v1-1-7465de7f741d@suse.com>
 <20260524235906.267EF1F000E9@smtp.kernel.org>
 <d329f22e75fd01f2250490e4cba87f064a726f52.camel@suse.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d329f22e75fd01f2250490e4cba87f064a726f52.camel@suse.com>

On Mon 2026-05-25 08:49:10, Marcos Paulo de Souza wrote:
> On Sun, 2026-05-24 at 23:59 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider:
> > - [Medium] `_remove_mod` uses `die()` which will terminate the script
> > during cleanup operations.
> > --
> > 
> > commit 7b1591f4e5c3b351136e7fe2821eb2e15ae59ad0
> > Author: Marcos Paulo de Souza <mpdesouza@suse.com>
> > 
> > selftests: livepatch: Introduce _remove_mod function
> > 
> > This commit introduces the _remove_mod internal function to remove a
> > loaded
> > module, intended to be used during cleanup when a testcase fails. It
> > also
> > refactors unload_mod to use this new helper function.
> > 
> > > diff --git a/tools/testing/selftests/livepatch/functions.sh
> > > b/tools/testing/selftests/livepatch/functions.sh
> > > index 2bc50271729c6..3ec0b7962fc5c 100644
> > > --- a/tools/testing/selftests/livepatch/functions.sh
> > > +++ b/tools/testing/selftests/livepatch/functions.sh
> > 
> > [ ... ]
> > 
> > > @@ -241,9 +241,10 @@ function load_failing_mod() {
> > >  	log "$ret"
> > >  }
> > >  
> > > -# unload_mod(modname) - unload a kernel module
> > > +# _remove_mod(modname) - Internal function to remove a loaded
> > > module.
> > > +#                        Use unload_mod() instead, which also
> > > updates TEST_MODS tracking.
> > >  #	modname - module name to unload
> > > -function unload_mod() {
> > > +function _remove_mod() {
> > >  	local mod="$1"
> > >  
> > >  	# Wait for module reference count to clear ...
> > > @@ -261,6 +262,14 @@ function unload_mod() {
> > >  		die "failed to unload module $mod (/sys/module)"
> > 
> > [Severity: Medium]
> > The commit message notes this function will be used to remove loaded
> > modules
> > when a testcase fails. If used in a cleanup path (such as a bash EXIT
> > trap),
> > will calling die() here terminate the script prematurely?
> > 
> > If a module fails to unload (for example, if its refcount doesn't
> > drop),
> > die() executes exit 1. Inside a trap, this aborts the rest of the
> > cleanup process. This could skip unloading any remaining modules and
> > prevent final cleanup operations like pop_config() from running,
> > potentially
> > leaving kernel tracing persistently enabled and polluting the system
> > state
> > for subsequent tests.
> 
> The system is already polluted when a testcase fails nowadays, since a
> module is kept loaded either way, making the next tests to fail if they
> also try to lead the same modules.
> 
> The current approach is trying to make it more reliable.

I believe that Sashiko suggested that the clean up path should not
use "die" or "exit" when something fails. It should try to continue
with the next cleanup task.

I remember that we even used the following in rpm post install scripts:

    command || true

It is useful when the script does several independent actions
and we would like to process as many of them as possible.

For example, in our case, if one module can't be unloaded
then we might still try to remove other modules and
call pop_config.

So, we should somehow distinguish when some code paths are
called in the script and when in the clean up part.

I would export some variable in the cleanup() function and
check it in the called code paths, for example:

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 9c98bbb8b725..eebc7f193d98 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -62,7 +62,9 @@ function has_kdir() {
 function die() {
 	log "ERROR: $1"
 	echo "ERROR: $1" >&2
-	exit 1
+	if [ -z "$in_klp_cleanup" ] ; then
+	    exit 1
+	fi
 }
 
 function push_config() {
@@ -128,6 +130,8 @@ function set_ftrace_enabled() {
 }
 
 function cleanup() {
+	export in_klp_cleanup=1
+
 	# Remove leftover modules in reverse order to handle dependencies
 	for mod_item in "${TEST_MODS[@]}"; do
 		if is_livepatch_mod "$mod_item"; then


Finally, I think how to split the changes into patches.

I think that the above changes which add "in_klp_cleanup" might be a
separate patch,

But the original 1st patch looked weird. It did split _remove_mod()
and talked about TEST_MODS tracking but the tracking was added in
2nd patch. I would prefer to split the function and add the tracking
in the same patch so that it is obvious why it is split and what
is the difference.

Best Regards,
Petr
